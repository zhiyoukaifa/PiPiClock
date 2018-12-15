//
//  ZSClockHomeView.m
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/2.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import "ZSClockHomeView.h"
#import "Header.h"

@interface ZSClockHomeView()

@property (nonatomic, strong) UIButton *btnSetting;      /**< zs20181205 设置按钮  */

@property (nonatomic, strong) UILabel *labYearMonthDay;     /**<zs20181215 展示年月日的label */

@property (nonatomic, strong) UILabel *labWeek;     /**<zs20181215 星期几 */

@end


@implementation ZSClockHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self addContentView];
        
    }
    return self;
}

#pragma mark - action
- (void)onClickAllBtn:(UIButton*)btn
{
    _blockZSClockHomeView(btn.tag,nil);
}



- (void)addContentView
{
//    [self addSubview:self.btnSetting];
//    self.btnSetting.frame = CGRectMake(20, 64, 100, 44);
}




- (UIButton *)btnSetting
{
    if (_btnSetting == nil) {
        
        _btnSetting = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSetting setTitle:@"设置" forState:(UIControlStateNormal)];
        [_btnSetting setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
        _btnSetting.backgroundColor = [UIColor yellowColor];
        [_btnSetting addTarget:self action:@selector(onClickAllBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btnSetting;
}



@end
