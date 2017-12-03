//
//  RootViewController.m
//  Layer
//
//  Created by 李鹏飞 on 2017/5/3.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "RootViewController.h"
#import "CustomerView.h"
#import "LineV.h"
#import "SecondViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"你好世界你是最美的");
      NSLog(@"你好世界你是最美的22");
    NSLog(@"你好世界你是最美的33");
}
- (IBAction)wwww:(UIButton *)sender {
    CustomerView *cust = [[CustomerView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    cust.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cust];
    
    
    
}
- (IBAction)line:(UIButton *)sender {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"100",@"ww", nil];
    NSString *str = dic[@"w"];
    NSLog(@"%@",str);
//    LineV *linev = [[LineV alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addSubview:linev];
}
- (IBAction)AleatV:(UIButton *)sender {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor redColor];
    CGFloat t = 4.0;
    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    view.transform = translateLeft;
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        view.transform = translateRight;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                view.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];

    
}
- (IBAction)share:(id)sender {
    [self cancleView];
    CustomerView *cust = [[CustomerView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    cust.backgroundColor = [UIColor redColor];
    [self.view addSubview:cust];
}
-(void)cancleView
{


}

- (IBAction)subLayer:(UIButton *)sender {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    UIBezierPath *path =[UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(20, 20)];
    CAShapeLayer *shap = [[CAShapeLayer alloc] init];
    shap.path = path.CGPath;
    view.layer.mask = shap;
    
}
- (IBAction)useal:(UIButton *)sender {
    CALayer *layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor =[UIColor redColor].CGColor;
    layer.anchorPoint = CGPointMake(1, 1); //  锚点,确定 layer 在父试图中的点 a
    layer.position = CGPointMake(150, 150); // 点a 在父试图中的坐标
    [self.view.layer addSublayer:layer];
    
     [ self.view setValue:[UIColor yellowColor] forKeyPath:@"backgroundColor"];
    [UIView animateWithDuration:5 animations:^{
        [layer setValue:@(M_PI *0.1) forKeyPath:@"transform.rotation.x"];
    }];
  
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    SecondViewController *secondV = [[SecondViewController alloc] init];
    secondV.name = @"张三";
    [self.navigationController pushViewController:secondV animated:YES];



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
