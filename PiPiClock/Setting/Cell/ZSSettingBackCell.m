//
//  ZSSettingBackCell.m
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/15.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import "ZSSettingBackCell.h"
#import "Header.h"

@interface ZSSettingBackCell()

@property (nonatomic, strong) UIButton *btnBack;         /**< zs20181215 返回按钮  */

@property (nonatomic, strong) UIView *viewBottom;        /**< zs20181215 底部的线条  */

@end


@implementation ZSSettingBackCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setBackgroundColor:[UIColor whiteColor]]; //设置背景颜色
        [self loadContentView];//加载内容
    }
    
    return self;
}

#pragma mark - private
- (void)loadContentView
{
    [self addSubview:self.btnBack];
    [self addSubview:self.viewBottom];
}
//https://www.jianshu.com/p/d1ce00f08b7f
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.btnBack.center = CGPointMake(self.width/2.0, self.height/2.0);
    self.btnBack.bounds = self.bounds;
    self.viewBottom.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);
}


- (UIButton *)btnBack
{
    if (_btnBack == nil) {
    
        _btnBack = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_btnBack setImage:[UIImage imageNamed:@"commonBack"] forState:(UIControlStateNormal)];
        _btnBack.userInteractionEnabled = NO;
    }
    return _btnBack;
}
- (UIView *)viewBottom
{
    if (_viewBottom == nil) {
        
        _viewBottom = [[UIView alloc] init];
        _viewBottom.backgroundColor = [UIColor grayColor];
    }
    return _viewBottom;
}

@end
