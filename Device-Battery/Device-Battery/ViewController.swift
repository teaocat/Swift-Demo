//
//  ViewController.swift
//  Device-Battery
//
//  Created by Teaocat on 2018/2/11.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var batteryStateLabel: UILabel!
    @IBOutlet weak var batteryLevelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 开启电池检测
        UIDevice.current.isBatteryMonitoringEnabled = true
        // 注册通知, 检测电池状态
        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateChange), name: NSNotification.Name.UIDeviceBatteryStateDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(batteryLevelChange), name: NSNotification.Name.UIDeviceBatteryLevelDidChange, object: nil)
        batteryStateChange()
        batteryLevelChange()
    }
    
    @objc func batteryStateChange() {
        // 判断电池状态
        switch UIDevice.current.batteryState {
        case .unknown:
            batteryStateLabel.text = "未知状态"
        case .unplugged:
            batteryStateLabel.text = "未充电"
        case .charging:
            batteryStateLabel.text = "充电中"
        case .full:
            batteryStateLabel.text = "已充满"
        }
    }
    
    @objc func batteryLevelChange() {
        batteryLevelLabel.text = "\(Int(UIDevice.current.batteryLevel * 100))%"
    }
}

