//
//  ViewController.swift
//  Cell逐个呈现
//
//  Created by Teaocat on 2018/2/12.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            [weak self] in self?.animateTable()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateTable() {
        let cells = tableView.visibleCells
        //        let tableHeight: CGFloat = tableView.bounds.height
        let tableWidth: CGFloat = tableView.bounds.width
        for (index, cell) in cells.enumerated() {
            //            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            cell.transform = CGAffineTransform(translationX: tableWidth, y: 0)
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = tableView.cellForRow(at: indexPath)
        UIView.beginAnimations(nil, context: nil)
        
        UIView.setAnimationDuration(0.2)
        
        cell?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.commitAnimations()
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        UIView.beginAnimations(nil, context: nil)
        
        UIView.setAnimationDuration(0.2) //设置动画时间
        
        cell?.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        UIView.commitAnimations()
    }
}
