//
//  ZSClockHomeVC.m
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/2.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import "ZSClockHomeVC.h"
#import "ZSClockHomeView.h"
#import "Header.h"
#import <CoreGraphics/CoreGraphics.h>
@interface ZSClockHomeVC ()
@property (nonatomic, strong) ZSClockHomeView *viewClock;        /**< zs20181202 时钟视图  */
//@property (weak, nonatomic) IBOutlet UIView *viewHomeClock;

@end

@implementation ZSClockHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationDidChange)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
//
//    if (self.view.width > self.view.height) {
//
//        self.viewClock.bounds = CGRectMake(0, 0, self.view.height, self.view.height);
//        self.viewClock.center = CGPointMake(self.view.width/2, self.view.height/2);
//
//    } else {
//        self.viewClock.bounds = CGRectMake(0, 0, self.view.width, self.view.width);
//        self.viewClock.center = CGPointMake(self.view.height/2, self.view.width/2);
//    }
//    NSLog(@"0___%@",NSStringFromCGRect(self.view.frame));
//    NSLog(@"1___%@",NSStringFromCGRect(self.viewHomeClock.frame));
//    NSLog(@"2___%@",NSStringFromCGPoint(self.viewHomeClock.center));
//
//    [self.viewHomeClock addSubview:self.viewClock];
    
//    [self layoutClockView];
//    self.viewClock.center = self.view.center;
    
    [self.view addSubview:self.viewClock];
//
//    CGRect frame = [[UIScreen mainScreen] bounds];
//
//    //    3.设置我们的View的中心点
//    CGPoint center = CGPointMake(frame.origin.x + ceil(frame.size.width/2), frame.origin.y + ceil(frame.size.height/2));
//    NSLog(@"2___%@",NSStringFromCGPoint(center));
//
//    self.viewClock.center = center;
}
//- (void)layoutClockView
//{
//    NSLog(@"1___%@",NSStringFromCGRect(self.view.frame));
//
//    if (self.view.width > self.view.height) {
//
//        self.viewHomeClock.bounds = CGRectMake(0, 0, self.view.height, self.view.height);
//    } else {
//        self.viewHomeClock.bounds = CGRectMake(0, 0, self.view.width, self.view.width);
//    }
//
//}
- (void)layoutClockView
{//
    CGRect frame = [[UIScreen mainScreen] bounds];

    NSLog(@"1___%@",NSStringFromCGRect(self.view.frame));
    NSLog(@"2___%@",NSStringFromCGRect(frame));
    NSLog(@"4___%@",NSStringFromCGPoint(self.view.center));

//{{{0, 0}, {768, 1024}} left
//{{0, 0}, {1024, 768}} up down
//_{{0, 0}, {768, 1024}} right
    if (self.view.width > self.view.height) {

        self.viewClock.bounds = CGRectMake(0, 0, self.view.height, self.view.height);
//        self.viewClock.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
//        self.viewClock.center = CGPointMake(self.view.height/2.0, self.view.width/2.0);
        NSLog(@"3___%@",NSStringFromCGPoint(self.viewClock.center));

    } else {
        self.viewClock.bounds = CGRectMake(0, 0, self.view.width, self.view.width);
//        self.viewClock.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
        NSLog(@"4___%@",NSStringFromCGPoint(self.viewClock.center));
    }
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
//     2.获取当前屏幕的大小
    
    self.viewClock.center = self.view.center;

//    3.设置我们的View的中心点
//    CGPoint center = CGPointMake(frame.origin.x + ceil(frame.size.width/2), frame.origin.y + ceil(frame.size.height/2));
    
//    4.根据当前电池条的方向，获取需要旋转的角度的大小。通常
    
//    if (orientation == UIInterfaceOrientationLandscapeLeft) {
//
//        self.viewClock.center = CGPointMake(384, 512);
//
//    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
//        self.viewClock.center = CGPointMake(384, 512);
//
//    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
//        self.viewClock.center = CGPointMake(512, 384);
//
//    } else {
//
//    }
    
    
    
}
- (void)onDeviceOrientationDidChange{
    [self layoutClockView];
}


#pragma mark - get set 方法
- (ZSClockHomeView *)viewClock
{
    if (_viewClock == nil) {
        
        _viewClock = [[ZSClockHomeView alloc] init];
    }
    return _viewClock;
}


@end
