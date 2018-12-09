//
//  ZSClockView.m
//  PiPiClock
//
//  Created by 道道明明白白 on 2018/12/4.
//  Copyright © 2018 道道明明白白. All rights reserved.
//

#import "ZSClockView.h"
#import "Header.h"

#define kClockW self.width

#define angle2radion(angle) ((angle) / 180.0 * M_PI)

// 1秒6度(秒针)

#define perSecondA 6

// 1分钟6度(分针)

#define perMintueA 6

// 1小时30度（时针）

#define perHourA 30

// 每分钟时针转(30 / 60 °)

#define perMinHourA 0.5


@interface ZSClockView()

@property (nonatomic, strong) UIScrollView *scrollViewClock;    /**< zs20181202 表盘切换ScrollView  */

//@property (nonatomic, strong) UIView *viewContainer;        /**< zs20181202 视图容器  */

@property (nonatomic, strong) CALayer *hourLayer;

@property (nonatomic, strong) CALayer *mintueLayer;

@property (nonatomic, strong) CALayer *secondLayer;

@property (nonatomic, strong) UIView *viewCircle;        /**< zs20181209 中间圆点  */

@property (nonatomic, strong) NSDictionary *momentAttribute;    /**< 刻度文字属性 */

@property (nonatomic, strong) NSArray *momentList;              /**< 刻度文字列表 */

@property (nonatomic, assign) CGFloat radius;

@end


@implementation ZSClockView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _momentList = @[@"12" ,@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11"];

        _momentAttribute = @{NSFontAttributeName : [UIFont systemFontOfSize:40],
                             NSForegroundColorAttributeName : [UIColor whiteColor]};//@"American Typewriter"
        
        self.backgroundColor = [UIColor blackColor];
        [self addContentView];
      
        //添加定时器
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
        [self timeChange];
    }
    return self;
}
//zs20181202 https://www.jianshu.com/p/eb2c4bb4e3f1
- (void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    self.layer.cornerRadius = self.width/2.0;
    self.layer.masksToBounds = YES;
}
- (void)drawRect:(CGRect)rect{

     NSLog(@"drawRect");
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
    CGContextSetStrokeColorWithColor(context,[UIColor whiteColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 2);
    _radius = (self.frame.size.width < self.frame.size.height) ? self.frame.size.width / 2 : self.frame.size.height / 2;
//    _radius = _radius - 2.0;
    CGContextAddArc(context,CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2, _radius, 0.f, 2 * M_PI, 0.f);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    NSArray *momentPointList = [self momentRectList];
    //绘制表盘刻度
    for (NSInteger i = 0; i < _momentList.count; i++) {
        NSString *momentStr = _momentList[i];
        CGPoint momentPoint = [momentPointList[i] CGPointValue];
        [momentStr drawAtPoint:momentPoint withAttributes:_momentAttribute];
    }
}

#pragma mark - private

- (void)addContentView
{
    // 添加时针
    
    [self setUpHourLayer];
    
    // 添加分针
    
    [self setUpMinuteLayer];
    
    // 添加秒针
    
    [self setUpSecondLayer];
    
    [self addSubview:self.viewCircle];
}
- (void)timeChange{
    
     NSLog(@"dddd");
    // 获取当前系统时间
    
    NSCalendar * calender = [NSCalendar currentCalendar];
    
    NSDateComponents * cmp = [calender components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour  fromDate:[NSDate date]];
    
    CGFloat second = cmp.second;
    
    CGFloat secondA = (second * perSecondA) ;
    
    NSInteger minute = cmp.minute;
    
    CGFloat mintuteA = minute * perMintueA ;
    
    NSInteger hour = cmp.hour;
    
    CGFloat hourA = hour * perHourA  + minute * perMinHourA;
    
    _secondLayer.transform = CATransform3DMakeRotation(angle2radion(secondA), 0, 0, 1);
    
    _mintueLayer.transform = CATransform3DMakeRotation(angle2radion(mintuteA), 0, 0, 1);
    
    _hourLayer.transform = CATransform3DMakeRotation(angle2radion(hourA), 0, 0, 1);
}
#pragma mark ------ 添加秒针
- (void)setUpSecondLayer{
    
    CALayer * secondL = [CALayer layer];
    
    secondL.backgroundColor = [UIColor redColor].CGColor ;
    
    // 设置锚点
    
    secondL.anchorPoint = CGPointMake(0.5, 1);
    
    secondL.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    
    secondL.bounds = CGRectMake(0, 0, 1, kClockW * 0.5 - 20);
    
    
    [self.layer addSublayer:secondL];
    
    _secondLayer = secondL;
}

#pragma mark ------ 添加分针
- (void)setUpMinuteLayer{
    
    CALayer * layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor whiteColor].CGColor ;
    
    // 设置锚点
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    layer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    
    layer.bounds = CGRectMake(0, 0, 4, kClockW * 0.5 - 30);
    
    layer.cornerRadius = 8;
    
    [self.layer addSublayer:layer];
    
    _mintueLayer = layer;
}

#pragma mark ------ 添加时针
- (void)setUpHourLayer{
    
    CALayer * layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor whiteColor].CGColor ;
    
    // 设置锚点
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    layer.position = CGPointMake(kClockW * 0.5, kClockW * 0.5);
    
    layer.bounds = CGRectMake(0, 0, 6, kClockW * 0.5 - 60);
    
    layer.cornerRadius = 10;
    
    [self.layer addSublayer:layer];
    
    _hourLayer = layer;
}


- (UIView *)viewCircle
{
    if (_viewCircle == nil) {
        
        _viewCircle = [[UIView alloc] init];
        _viewCircle.center = CGPointMake(self.width/2.0, self.height/2.0);
        _viewCircle.bounds = CGRectMake(0, 0, 16, 16);
        _viewCircle.layer.cornerRadius = 8;
        _viewCircle.layer.masksToBounds = YES;
        _viewCircle.backgroundColor = [UIColor whiteColor];
    }
    return _viewCircle;
}
- (NSArray *)momentRectList{
    NSMutableArray *pointList = [NSMutableArray array];
    CGRect maxfontRect = [_momentList[0] boundingRectWithSize:CGSizeMake(_radius, MAXFLOAT)
                                                      options:0
                                                   attributes:_momentAttribute
                                                      context:nil];
    CGFloat samllerRadius = _radius - MAX(maxfontRect.size.width/2, maxfontRect.size.height/2);
    for (NSInteger i = 0; i < 12; i++) {
        NSString *momentStr = _momentList[i];
        CGRect fontRect = [momentStr boundingRectWithSize:CGSizeMake(_radius, MAXFLOAT)
                                                  options:0
                                               attributes:_momentAttribute
                                                  context:nil];
        
        CGFloat angle = i * 30;
        CGFloat x = CGRectGetWidth(self.frame)/2 + samllerRadius * sin(angle * M_PI / 180.f) - fontRect.size.width / 2;
        CGFloat y = CGRectGetHeight(self.frame)/2 - samllerRadius * cos(angle * M_PI / 180.f) - fontRect.size.height / 2 ;
        
        [pointList addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    }
    
    return pointList;
}



//- (UIView *)viewContainer
//{
//    if (_viewContainer == nil) {
//
//        _viewContainer = [[UIView alloc] init];
//    }
//    return _viewContainer;
//}


@end
