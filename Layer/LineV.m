//
//  LineV.m
//  Layer
//
//  Created by 李鹏飞 on 2017/5/3.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "LineV.h"

@implementation LineV
{
    UIImageView *imv;
}
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    imv = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    imv.image = [UIImage imageNamed:@"heart"];
    [self addSubview:imv];
    
        return self;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    self.path = path;

}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [self.path addLineToPoint:point];
    [self setNeedsDisplayInRect:self.bounds];
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef contenx = UIGraphicsGetCurrentContext();
   CGContextSetRGBStrokeColor(contenx, 70.0 / 255.0, 241.0 / 255.0, 241.0 / 255.0, 1.0);
    [self.path stroke];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 2.0;
    animation.repeatCount = MAXFLOAT;
    animation.path =self.path.CGPath;
    [imv.layer addAnimation:animation forKey:nil];
    

}
@end
