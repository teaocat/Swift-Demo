//
//  AppDelegate.m
//  OC-TwitterBird
//
//  Created by Teaocat on 2018/2/4.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

#import "AppDelegate.h"

@interface AppDelegate () <CAAnimationDelegate>

/// 遮罩层
@property (nonatomic, strong) CALayer *mask;
/// 图片
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 设置图片
    self.imageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    self.imageView.image = [UIImage imageNamed:@"twitterScreen"];
    [self.window addSubview:self.imageView];
    
    // 设置遮罩层
    self.mask = [[CALayer alloc] init];
    self.mask.contents = (__bridge id _Nullable)([UIImage imageNamed:@"twitterBird"].CGImage);
    self.mask.position = self.imageView.center;
    self.mask.bounds = CGRectMake(0, 0, 100, 80);
    self.imageView.layer.mask = self.mask;
    
    [self animateMask];
    
    // 显示window
    self.window.rootViewController = [[UIViewController alloc] init];
    self.window.backgroundColor = [UIColor colorWithRed:70.0/255.0 green:154.0/255.0 blue:233.0/255.0 alpha:1];
    [self.window makeKeyAndVisible];

    // 隐藏状态栏
    [UIApplication sharedApplication].statusBarHidden = YES;
    return YES;
}

- (void)animateMask {
    CAKeyframeAnimation *keyFrameAnimation = [[CAKeyframeAnimation alloc] init];
    keyFrameAnimation.keyPath = @"bounds";
    keyFrameAnimation.delegate = self;
    keyFrameAnimation.duration = 1;
    keyFrameAnimation.beginTime = CACurrentMediaTime() + 1;
    
    NSValue *initialBounds = [NSValue valueWithCGRect:self.mask.bounds];
    NSValue *secondBounds = [NSValue valueWithCGRect:CGRectMake(0, 0, 80, 64)];
    NSValue *finalBounds = [NSValue valueWithCGRect:CGRectMake(0, 0, 2000, 2000)];
    keyFrameAnimation.values = @[initialBounds, secondBounds, finalBounds];
    
    keyFrameAnimation.keyTimes = @[@0, @0.3, @1];
    
    [self.mask addAnimation:keyFrameAnimation forKey:@"bounds"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.imageView.layer.mask = nil;
}

@end
