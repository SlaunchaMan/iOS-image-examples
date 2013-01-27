//
//  JKCustomDrawnView.m
//  ImageExamples
//
//  Created by Jeff Kelley on 1/9/13.
//  Copyright (c) 2013 Detroit Labs. All rights reserved.
//


#import "JKCustomDrawnView.h"


@implementation JKCustomDrawnView

- (void)drawRect:(CGRect)rect
{
    CGRect circleRect = CGRectInset(rect, 2.0f, 2.0f);
    
    UIColor *borderColor = [UIColor blueColor];
    UIColor *circleColor = [UIColor orangeColor];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [circleColor CGColor]);
    CGContextFillEllipseInRect(context, circleRect);
    
    CGContextSetStrokeColorWithColor(context, [borderColor CGColor]);
    CGContextSetLineWidth(context, 4.0f);
    CGContextStrokeEllipseInRect(context, circleRect);
}

@end
