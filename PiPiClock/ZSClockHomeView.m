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

@property (nonatomic, strong) UIScrollView *scrollViewClock;    /**< zs20181202 表盘切换ScrollView  */

@property (nonatomic, strong) UIView *viewContainer;        /**< zs20181202 视图容器  */

@end


@implementation ZSClockHomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor orangeColor];
        [self addContentView];
    }
    return self;
}
//zs20181202 https://www.jianshu.com/p/eb2c4bb4e3f1
- (void)layoutSubviews
{
     NSLog(@"layoutSubviews");
//    self.viewContainer.bounds = self.bounds;
//    self.viewContainer.center = self.center;
    self.layer.cornerRadius = self.width/2.0;
    self.layer.masksToBounds = YES;
}

- (void)addContentView
{
//    [self addSubview:self.viewContainer];
//    self.viewContainer.backgroundColor = [UIColor blackColor];
}


- (UIView *)viewContainer
{
    if (_viewContainer == nil) {
        
        _viewContainer = [[UIView alloc] init];
    }
    return _viewContainer;
}

@end
