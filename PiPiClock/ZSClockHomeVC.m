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
@interface ZSClockHomeVC ()

@property (nonatomic, strong) ZSClockHomeView *viewHomeClock;        /**< zs20181202 时钟视图  */

@property (nonatomic, strong) ZSClockView *viewClock;     /**< zs20181204 时钟view  */


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
        
        ZSSettingVC *vc = [[ZSSettingVC alloc] init];
        [weakSelf.navigationController presentViewController:vc animated:YES completion:nil];
//        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    }];

}

#pragma mark - private
- (void)settingClockViewFrame
{
    if (self.view.width > self.view.height) {

        self.viewClock.bounds = CGRectMake(0, 0, self.view.height, self.view.height);
        NSLog(@"3___%@",NSStringFromCGPoint(self.viewHomeClock.center));

    } else {
        self.viewClock.bounds = CGRectMake(0, 0, self.view.width, self.view.width);
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
    [self layoutClockView];
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
        
        _viewClock = [[ZSClockView alloc] init];
    }
    return _viewClock;
}


@end

