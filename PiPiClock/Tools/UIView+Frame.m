//
//  UIView+Frame.m
//
//
//  Created by 道道明明白白 on 2018/11/22.
//  Copyright © 2018年 道道明明白白. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - public

- (NSString*)description_frame {
    return [NSString stringWithFormat:@"%@\n x=%f\n y=%f\n width=%f\n height=%f\n xAndWidth=%f\n yAndHeight=%f\n",self,self.x,self.y,self.width,self.height,self.xAddWidth,self.yAddHeight];
}


#pragma mark - get set 方法
#pragma mark ------ get
- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)xAddWidth {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)yAddHeight {
    return self.frame.origin.y + self.frame.size.height;
}

#pragma mark ------ set
- (void)setX:(CGFloat)x {
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (void)setWidth:(CGFloat)width {
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}



@end
