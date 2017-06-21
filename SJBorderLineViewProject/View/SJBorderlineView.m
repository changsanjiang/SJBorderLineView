//
//  SJBorderlineView.m
//  SJLine
//
//  Created by BlueDancer on 2017/6/11.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJBorderlineView.h" 

@interface SJBorderlineView ()

@property (nonatomic, assign, readwrite) SJBorderlineType type;
@property (nonatomic, assign, readwrite) CGFloat startMargin;
@property (nonatomic, assign, readwrite) CGFloat endMargin;
@property (nonatomic, strong, readwrite) UIColor *lineColor;

@end

@implementation SJBorderlineView

+ (instancetype)borderlineViewWithType:(SJBorderlineType)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color {
    SJBorderlineView *view = [SJBorderlineView new];
    view.backgroundColor = [UIColor whiteColor];
    view.type = type;
    view.startMargin = startMargin;
    view.endMargin = endMargin;
    view.lineColor = color;
    return view;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 1.0;
    
    CGPoint movePoint = CGPointZero;
    CGPoint addLineToPoint = CGPointZero;
    
    switch (self.type) {
        case SJBorderlineTypeTop:
        {
            movePoint = CGPointMake(self.startMargin, 0);
            addLineToPoint = CGPointMake(rect.size.width - self.endMargin, 0);
        }
            break;
        case SJBorderlineTypeLeading:
        {
            movePoint = CGPointMake(0, self.startMargin);
            addLineToPoint = CGPointMake(0, rect.size.height - self.endMargin);
        }
            break;
        case SJBorderlineTypeBottom:
        {
            movePoint = CGPointMake(self.startMargin, rect.size.height);
            addLineToPoint = CGPointMake(rect.size.width - self.endMargin, rect.size.height);
        }
            break;
        case SJBorderlineTypeTrailing:
        {
            movePoint = CGPointMake(rect.size.width, self.startMargin);
            addLineToPoint = CGPointMake(rect.size.width, rect.size.height - self.endMargin);
        }
            break;
        default:
            break;
    }
    
    [bezierPath moveToPoint:movePoint];
    [bezierPath addLineToPoint:addLineToPoint];
    [self.lineColor setStroke];
    [bezierPath strokeWithBlendMode:kCGBlendModeCopy alpha:1];
}

@end
