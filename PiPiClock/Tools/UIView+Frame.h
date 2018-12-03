//
//  UIView+Frame.h
//  
//
//  Created by 道道明明白白 on 2018/11/22.
//  Copyright © 2018年 道道明明白白. All rights reserved.
//

/**
 * zs20181122 利用类别设置一些UIView常用的位置获取
 * https://blog.csdn.net/charlesyaoxin/article/details/47685073
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign,readonly) CGFloat xAddWidth;
@property (nonatomic,assign,readonly) CGFloat yAddHeight;


/**
 zs20181122 返回调用者的描述信息 不能直接用description作为方法名

 @return 返回的描述信息
 */
- (NSString*)description_frame;

@end

NS_ASSUME_NONNULL_END
