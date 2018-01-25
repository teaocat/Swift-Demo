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

class ViewController: UIViewController {
    
    var loopView: MTLoopView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loopView = MTLoopView(frame: view.bounds)
        loopView?.items = []
        for i in 1...7 {
            loopView?.items?.append("image0\(i)")
        }
        view.addSubview(loopView!)
    }
}
