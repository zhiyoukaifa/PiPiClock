//
//  ZSSettingBrightnessCell.h
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/15.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 zs20181215 滑动屏幕调整屏幕亮度的开关
 */
@interface ZSSettingBrightnessCell : UITableViewCell


/**
 zs20181215 刷新标题

 @param strTitle 标题
 */
- (void)reloadLabTitleText:(NSString*)strTitle;

@end

NS_ASSUME_NONNULL_END
