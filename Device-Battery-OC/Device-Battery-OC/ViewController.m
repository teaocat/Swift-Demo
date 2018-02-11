//
//  ViewController.m
//  Device-Battery-OC
//
//  Created by Teaocat on 2018/2/11.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIDevice *device = [UIDevice currentDevice];
    //开启电池检测
    device.batteryMonitoringEnabled = YES;
    //注册通知，当充电状态改变时调用batteryStateChange方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryStateChange) name:UIDeviceBatteryStateDidChangeNotification object:nil];
}

-(void) batteryStateChange {
    UIDevice *device = [UIDevice currentDevice];
    //获取当前电量
    float batteryVolume = device.batteryLevel * 100;
    //计算电池电量百分比
    NSString *batteryVolumeString = [NSString stringWithFormat:@"当前电量：%.0f%%",batteryVolume];
    //根据电池状态切换时，给出提醒
    switch (device.batteryState) {
        case UIDeviceBatteryStateUnplugged:{
            //提醒
            NSString *string = [NSString stringWithFormat:@"未充电，%@",batteryVolumeString];
            [self showAlert:string];
            break;}
        case UIDeviceBatteryStateCharging:{
            NSString *string = [NSString stringWithFormat:@"充电中，%@",batteryVolumeString];
            [self showAlert:string];
            break;
        }
        case UIDeviceBatteryStateFull:{
            NSString *string = [NSString stringWithFormat:@"已充满，%@",batteryVolumeString];
            [self showAlert:string];
            break;
        }
        case UIDeviceBatteryStateUnknown:{
            [self showAlert:@"未知状态"];
            break;
        }
        default:
            break;
    }
}

-(void) showAlert:(NSString *) string {
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertview show];
}

@end
