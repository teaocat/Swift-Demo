//
//  AppDelegate.swift
//  TwitterBird
//
//  Created by Teaocat on 2018/2/4.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate {

    var window: UIWindow?
    var mask: CALayer?
    var imageView: UIImageView?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            // 添加背景图片
            imageView = UIImageView(frame: window.bounds)
            imageView?.image = UIImage(named: "twitterScreen")
            window.addSubview(imageView!)
            
            // 添加图片遮罩层
            mask = CALayer()
            mask?.contents = UIImage(named: "twitterBird")?.cgImage
            mask?.position = window.center
            mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
            imageView?.layer.mask = mask
            
            animateMask()
            
            // 添加根控制器,并显示window
            window.rootViewController = UIViewController()
            window.backgroundColor = UIColor(red: 70/255, green: 154/255, blue: 233/255, alpha: 1)
            window.makeKeyAndVisible()
        }
        
        // 隐藏状态条
        UIApplication.shared.isStatusBarHidden = true
        return true
    }
    
    // 动画调用
    func animateMask() {
        // 创建帧动画实例
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 1
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 1
        
        // 创建动画帧
        let initialBounds = NSValue(cgRect: mask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 64))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2000, height: 2000))
        keyFrameAnimation.values = [initialBounds, secondBounds, finalBounds]
        
        // 设置动画帧间隔时间
        keyFrameAnimation.keyTimes = [0, 0.3, 1]
        
        // 添加动画到遮罩上
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        mask?.add(keyFrameAnimation, forKey: "bounds")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        imageView?.layer.mask = nil
    }
}

