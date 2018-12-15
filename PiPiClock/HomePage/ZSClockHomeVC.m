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
#import "ZSClockView.h"
#import "ZSSettingVC.h"
#import "ZSSettingTableVC.h"

#define kWidthSide 5
@interface ZSClockHomeVC ()

@property (nonatomic, strong) ZSClockHomeView *viewHomeClock;        /**< zs20181202 时钟视图  */

@property (nonatomic, strong) ZSClockView *viewClock;     /**< zs20181204 时钟view  */

//@property (nonatomic, strong) ZSSettingTableVC

@end

@implementation ZSClockHomeVC

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationDidChange)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];//zs20181204 启动的时候会调用一次
    
    [self.view addSubview:self.viewHomeClock];
    [self.view addSubview:self.viewClock];
    
    
    __weak typeof(self) weakSelf = self;
    [self.viewHomeClock setBlockZSClockHomeView:^(NSInteger tag, id  _Nonnull obj) {
        
        ZSSettingTableVC *vc = [[ZSSettingTableVC alloc] init];
        [weakSelf.navigationController presentViewController:vc animated:YES completion:nil];        
    }];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}







#pragma mark - private
- (void)settingClockViewFrame
{
    if (self.view.width > self.view.height) {

        self.viewClock.bounds = CGRectMake(0, 0, self.view.height  - kWidthSide, self.view.height - kWidthSide);
        NSLog(@"3___%@",NSStringFromCGPoint(self.viewHomeClock.center));

    } else {
        self.viewClock.bounds = CGRectMake(0, 0, self.view.width - kWidthSide, self.view.width - kWidthSide);
        NSLog(@"4___%@",NSStringFromCGPoint(self.viewHomeClock.center));
    }
    self.viewClock.center = self.view.center;
}
- (void)layoutClockView
{
    [self settingClockViewFrame];

//    CGRect frame = [[UIScreen mainScreen] bounds];
//    NSLog(@"1___%@",NSStringFromCGRect(self.view.frame));
//    NSLog(@"2___%@",NSStringFromCGRect(frame));
//    NSLog(@"4___%@",NSStringFromCGPoint(self.view.center));
//{{{0, 0}, {768, 1024}} left
//{{0, 0}, {1024, 768}} up down
//_{{0, 0}, {768, 1024}} right
}
- (void)onDeviceOrientationDidChange{
    //zs20181215 在其他页面 虽然也监控到了屏幕旋转 但是返回的坐标 还是原来的为
//    [self layoutClockView];
    
    if (self.view.width > self.view.height) {
        
        self.viewClock.bounds = CGRectMake(0, 0, self.view.height  - kWidthSide, self.view.height - kWidthSide);
//        NSLog(@"3___%@",NSStringFromCGPoint(self.viewHomeClock.center));
    } else {
        self.viewClock.bounds = CGRectMake(0, 0, self.view.width - kWidthSide, self.view.width - kWidthSide);
//        NSLog(@"4___%@",NSStringFromCGPoint(self.viewHomeClock.center));
    }
    //zs20181215 无论在哪个页面 屏幕UIScreen的宽度是及时变得 所以这里取得是屏幕的 解决在其他页面 横竖屏 返回此页面的适配问题
    UIScreen *screen = [UIScreen mainScreen];
    CGRect  bounds = screen.bounds;
    NSLog(@"bounds____%@",NSStringFromCGRect(bounds));
    self.viewClock.center = CGPointMake(bounds.size.width/2.0, bounds.size.height/2.0);
    
    return;
 

}


#pragma mark - get set 方法
- (ZSClockHomeView *)viewHomeClock
{
    if (_viewHomeClock == nil) {
        
        _viewHomeClock = [[ZSClockHomeView alloc] initWithFrame:self.view.bounds];
    }
    return _viewHomeClock;
}
- (ZSClockView *)viewClock
{
    if (_viewClock == nil) {
        
        CGRect bounds;
        if (self.view.width > self.view.height) {
            
            bounds = CGRectMake(0, 0, self.view.height  - kWidthSide , self.view.height - kWidthSide);
        } else {
            bounds = CGRectMake(0, 0, self.view.width - kWidthSide, self.view.width - kWidthSide);
        }
        _viewClock = [[ZSClockView alloc] initWithFrame:bounds];
        _viewClock.center = self.view.center;
    }
    return _viewClock;
}

/*
 UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
 switch (deviceOrientation) {
 case UIDeviceOrientationFaceUp:
 NSLog(@"屏幕朝上平躺");
 break;
 
 case UIDeviceOrientationFaceDown:
 NSLog(@"屏幕朝下平躺");
 break;
 
 case UIDeviceOrientationUnknown:
 NSLog(@"未知方向");
 break;
 
 case UIDeviceOrientationLandscapeLeft:{
 NSLog(@"屏幕向右橫置");
 
 
 self.viewClock.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
 }
 break;
 
 case UIDeviceOrientationLandscapeRight:
 NSLog(@"屏幕向右橫置");
 self.viewClock.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
 
 break;
 
 case UIDeviceOrientationPortrait:{
 NSLog(@"屏幕直立");
 self.viewClock.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
 
 }
 break;
 
 case UIDeviceOrientationPortraitUpsideDown:
 NSLog(@"屏幕直立，上下顛倒");
 break;
 
 default:
 NSLog(@"无法辨识");
 break;
 }
 
 */
@end

