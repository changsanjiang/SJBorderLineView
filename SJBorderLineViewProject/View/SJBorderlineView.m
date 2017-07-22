//
//  SJBorderlineView.m
//  SJLine
//
//  Created by BlueDancer on 2017/6/11.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "SJBorderlineView.h"

@interface SJBorderlineView ()

@property (nonatomic, assign, readwrite) SJBorderlineSide type;
@property (nonatomic, assign, readwrite) CGFloat startMargin;
@property (nonatomic, assign, readwrite) CGFloat endMargin;
@property (nonatomic, strong, readwrite) UIColor *lineColor;
@property (nonatomic, assign, readwrite) CGFloat lineWidth;

@end

@implementation SJBorderlineView

+ (instancetype)borderlineViewWithSide:(SJBorderlineSide)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    return [self borderlineViewWithSide:type startMargin:startMargin endMargin:endMargin lineColor:color lineWidth:1.0 backgroundColor:backgroundColor];
}

+ (instancetype)borderlineViewWithSide:(SJBorderlineSide)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color lineWidth:(CGFloat)width backgroundColor:(UIColor *)backgroundColor {
    SJBorderlineView *view = [SJBorderlineView new];
    view.backgroundColor = backgroundColor;
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
    
    if ( 0 == self.type ) return;
    if ( SJBorderlineSideAll == ( self.type & SJBorderlineSideAll ) ) {
        movePoint = CGPointMake(self.startMargin, 0);
        addLineToPoint = CGPointMake(rect.size.width - self.endMargin, 0);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
        
        movePoint = CGPointMake(0, self.startMargin);
        addLineToPoint = CGPointMake(0, rect.size.height - self.endMargin);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
        
        movePoint = CGPointMake(self.startMargin, rect.size.height);
        addLineToPoint = CGPointMake(rect.size.width - self.endMargin, rect.size.height);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
        
        movePoint = CGPointMake(rect.size.width, self.startMargin);
        addLineToPoint = CGPointMake(rect.size.width, rect.size.height - self.endMargin);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
        return;
    }
    
    if ( SJBorderlineSideTop == ( self.type & SJBorderlineSideTop ) ) {
        movePoint = CGPointMake(self.startMargin, 0);
        addLineToPoint = CGPointMake(rect.size.width - self.endMargin, 0);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
    if ( SJBorderlineSideLeading == ( self.type & SJBorderlineSideLeading ) ) {
        movePoint = CGPointMake(0, self.startMargin);
        addLineToPoint = CGPointMake(0, rect.size.height - self.endMargin);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
    if ( SJBorderlineSideBottom == ( self.type & SJBorderlineSideBottom ) ) {
        movePoint = CGPointMake(self.startMargin, rect.size.height);
        addLineToPoint = CGPointMake(rect.size.width - self.endMargin, rect.size.height);
        [self drawLineWithBezierPath:bezierPath MovePoint:movePoint addLineToPoint:addLineToPoint];
    }
    if ( SJBorderlineSideTrailing == ( self.type & SJBorderlineSideTrailing ) ) {
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
