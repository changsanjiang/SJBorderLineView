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
@property (nonatomic, assign, readwrite) CGFloat lineWidth;

@end

@implementation SJBorderlineView

+ (instancetype)borderlineViewWithType:(SJBorderlineType)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color {
    return [self borderlineViewWithType:type startMargin:startMargin endMargin:endMargin lineColor:color lineWidth:1.0];
}

+ (instancetype)borderlineViewWithType:(SJBorderlineType)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color lineWidth:(CGFloat)width {
    SJBorderlineView *view = [SJBorderlineView new];
    view.type = type;
    view.startMargin = startMargin;
    view.endMargin = endMargin;
    view.lineColor = color;
    view.lineWidth = width;
    return view;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 1.0;
    
    CGPoint movePoint = CGPointZero;
    CGPoint addLineToPoint = CGPointZero;
    
    if      ( 0 == self.type ) return;
    if ( SJBorderlineTypeTop == ( self.type & SJBorderlineTypeTop ) ) {
        movePoint = CGPointMake(self.startMargin, 0);
        addLineToPoint = CGPointMake(rect.size.width - self.endMargin, 0);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
    if ( SJBorderlineTypeLeading == ( self.type & SJBorderlineTypeLeading ) ) {
        movePoint = CGPointMake(0, self.startMargin);
        addLineToPoint = CGPointMake(0, rect.size.height - self.endMargin);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
    if ( SJBorderlineTypeBottom == ( self.type & SJBorderlineTypeBottom ) ) {
        movePoint = CGPointMake(self.startMargin, rect.size.height);
        addLineToPoint = CGPointMake(rect.size.width - self.endMargin, rect.size.height);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
    if ( SJBorderlineTypeTrailing == ( self.type & SJBorderlineTypeTrailing ) ) {
        movePoint = CGPointMake(rect.size.width, self.startMargin);
        addLineToPoint = CGPointMake(rect.size.width, rect.size.height - self.endMargin);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
}

- (void)drawLineWithBezierPath:(UIBezierPath *)bezierPath MovePoint:(CGPoint)movePoint addLineToPoint:(CGPoint)addLineToPoint {
    bezierPath.lineWidth = self.lineWidth * 2;
    [bezierPath moveToPoint:movePoint];
    [bezierPath addLineToPoint:addLineToPoint];
    [self.lineColor setStroke];
    [bezierPath strokeWithBlendMode:kCGBlendModeCopy alpha:1];
}

@end
