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
    
    private let loopView = UICollectionView(frame: CGRect.zero, collectionViewLayout: MTLayout())
    var items: [String]?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoopView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        return items?.count ?? 3
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
        cell.imageView.image = UIImage(named: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(items?[indexPath.item] ?? "\(indexPath.item)")")
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
