//
//  ViewController.swift
//  LoopView-Swift
//
//  Created by Teaocat on 2018/1/25.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

import UIKit

class ViewController: UIViewController, MTLoopViewDelegate {
    
    var loopView: MTLoopView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loopView = MTLoopView(frame: view.bounds)
        loopView?.isStartTimer = true
        loopView?.delegate = self
        loopView?.items = []
        for i in 1...7 {
            loopView?.items?.append(LoopItem(image: UIImage(named: "image0\(i)"), url: nil))
        }
        view.addSubview(loopView!)
    }
    
    func loopViewClickItem(item: LoopItem) {
        print(item)
    }
}
