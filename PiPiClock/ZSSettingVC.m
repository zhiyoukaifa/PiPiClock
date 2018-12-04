//
//  ZSSettingVC.m
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/4.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import "ZSSettingVC.h"

@interface ZSSettingVC ()
@property (nonatomic, strong) UIButton *btnBack;      /**< zs20181205 设置按钮  */

@end

@implementation ZSSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.btnBack.frame = CGRectMake(10, 64, 100, 44);
    [self.view addSubview:self.btnBack];

}

- (void)onClickAllBtn:(UIButton*)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIButton *)btnBack
{
    if (_btnBack == nil) {
        
        _btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnBack setTitle:@"取消" forState:(UIControlStateNormal)];
        [_btnBack setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
        _btnBack.backgroundColor = [UIColor yellowColor];
        [_btnBack addTarget:self action:@selector(onClickAllBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btnBack;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
