//
//  ZSSettingBrightnessCell.m
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/15.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import "ZSSettingBrightnessCell.h"
#import "Header.h"

@interface ZSSettingBrightnessCell()

@property (nonatomic,strong) UILabel *labTitle;      /**< zs20181215 标题  */

@property (nonatomic, strong) UISwitch *switchView;      /**< zs20181215 开关视图  */

@property (nonatomic, strong) UIView *viewBottom;        /**< zs20181215 底部的线条  */

@end

@implementation ZSSettingBrightnessCell

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


#pragma mark - public
- (void)reloadLabTitleText:(NSString*)strTitle
{
    self.labTitle.text = strTitle;
}



- (void)loadContentView
{
    [self addSubview:self.switchView];
    [self addSubview:self.labTitle];
    [self addSubview:self.viewBottom];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.labTitle.frame = CGRectMake(15, 0, self.width, self.height);
    self.switchView.bounds = CGRectMake(0, 0, 80, 30);
    self.switchView.center = CGPointMake(self.width - 40, self.height/2.0);
    self.viewBottom.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);
//    self.switchView.backgroundColor = [UIColor redColor];
}


#pragma mark - getter
- (UISwitch *)switchView
{
    if (_switchView == nil) {
        
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}
- (UILabel *)labTitle
{
    if (_labTitle == nil) {
    
        _labTitle = [[UILabel alloc] init];
        _labTitle.font = [UIFont systemFontOfSize:14];
        _labTitle.textColor = [UIColor grayColor];
//        _labTitle.text = @"滑动屏幕调整亮度";
        _labTitle.textAlignment = NSTextAlignmentLeft;
    }
    return _labTitle;
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
