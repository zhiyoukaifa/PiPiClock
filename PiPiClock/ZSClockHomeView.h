//
//  ZSClockHomeView.h
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/2.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface ZSClockHomeView : UIView


@property (nonatomic, strong) void (^blockZSClockHomeView)(NSInteger tag, _Nullable id obj);

@end

NS_ASSUME_NONNULL_END
