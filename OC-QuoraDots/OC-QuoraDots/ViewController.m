//
//  ViewController.m
//  OC-QuoraDots
//
//  Created by Teaocat on 2018/2/5.
//  Copyright © 2018年 learning-swift. All rights reserved.
//
//  Github: https://github.com/teaocat
//
    

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *dotOne;
@property (weak, nonatomic) IBOutlet UIImageView *dotTwo;
@property (weak, nonatomic) IBOutlet UIImageView *dotThree;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dotOne.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01, 0.01);
    self.dotTwo.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01, 0.01);
    self.dotThree.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.01, 0.01);

    __weak typeof(self) weakself = self;
    
    [UIView animateWithDuration:0.6 delay:0.0 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        weakself.dotOne.transform = CGAffineTransformIdentity;
    } completion:nil];
    [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        weakself.dotTwo.transform = CGAffineTransformIdentity;
    } completion:nil];
    [UIView animateWithDuration:0.6 delay:0.4 options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        weakself.dotThree.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
