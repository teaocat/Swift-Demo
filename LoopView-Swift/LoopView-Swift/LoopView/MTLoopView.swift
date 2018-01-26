//
//  MTLoopView.swift
//  LoopView-Swift
//
//  Created by Teaocat on 2018/1/25.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

import UIKit

fileprivate let cellIdentifier = "LoopCell"

class MTLoopView: UIView {
    // MARK: Variable
    private let loopView = UICollectionView(frame: CGRect.zero, collectionViewLayout: MTLayout())
    var isFirstShow: Bool = true
    var items: [String]?
    fileprivate var loopItems: [String] {
        get {
            guard let items = items else {
                return []
            }
            return items + items + items
        }
    }
    
    // MARK: Root View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoopView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: MTLoopView Action
    private func setupLoopView() {
        loopView.delegate = self
        loopView.dataSource = self
        loopView.frame = bounds
        loopView.register(MTLoopCell.self, forCellWithReuseIdentifier: cellIdentifier)
        addSubview(loopView)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MTLoopView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return loopItems.count > 0 ? loopItems.count : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MTLoopCell
        guard let items = items else {
            let red = CGFloat(Double(arc4random_uniform(256))/255.0)
            let green = CGFloat(Double(arc4random_uniform(256))/255.0)
            let blue = CGFloat(Double(arc4random_uniform(256))/255.0)
            cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
            return cell
        }
        if indexPath.item == 0, isFirstShow {
            isFirstShow = !isFirstShow
            collectionView.scrollToItem(at: IndexPath(item: items.count, section: 0), at: .left, animated: false)
        }
        cell.imageView.image = UIImage(named: loopItems[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let items = items else {
            return
        }
        let offsetX = scrollView.contentOffset.x
        let width = scrollView.bounds.width
        let page = Int(offsetX / width)
        if page == items.count - 2 {
            loopView.scrollToItem(at: IndexPath(item: (items.count * 2 - 1), section: 0), at: .left, animated: false)
        } else if page == items.count * 2 {
            loopView.scrollToItem(at: IndexPath(item: (items.count), section: 0), at: .left, animated: false)
        }
    }
}

// MARK: - MTLoopCell
class MTLoopCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
}

// MARK: - MTLayout
class MTLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else {
            return
        }
        itemSize = collectionView.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        scrollDirection = .horizontal
    }
}

// MARK: - LoopItem
struct LoopItem {
    let image: UIImage?
    let url: URL?
}
