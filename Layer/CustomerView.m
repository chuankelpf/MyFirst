//
//  CustomerView.m
//  Layer
//
//  Created by 李鹏飞 on 2017/5/3.
//  Copyright © 2017年 李鹏飞. All rights reserved.
//

#import "CustomerView.h"

@implementation CustomerView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef contect = UIGraphicsGetCurrentContext();
    // 设置起点
    CGContextMoveToPoint(contect, 50, 0);
    CGContextAddLineToPoint(contect, 0, 100);
    CGContextAddLineToPoint(contect, 100, 100);
    CGContextSetLineWidth(contect, 10);
    CGContextClosePath(contect);
    // 设置颜色
    [[UIColor redColor] setFill]; //  填充里边的内容的颜色
    [[UIColor redColor] setStroke];  //线条的颜色
    CGContextFillPath(contect);
    
    
}


@end
