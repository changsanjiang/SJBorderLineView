//
//  SJBorderlineView.h
//  SJLine
//
//  Created by BlueDancer on 2017/6/11.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SJBorderlineSide) {
    SJBorderlineSideNone     = 0,
    SJBorderlineSideTop      = 1 << 0,
    SJBorderlineSideLeading  = 1 << 1,
    SJBorderlineSideTrailing = 1 << 2,
    SJBorderlineSideBottom   = 1 << 3,
    SJBorderlineSideAll      = 1 << 4,
};

@interface SJBorderlineView : UIView

+ (instancetype)borderlineViewWithSide:(SJBorderlineSide)side startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor;

+ (instancetype)borderlineViewWithSide:(SJBorderlineSide)side startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color lineWidth:(CGFloat)width backgroundColor:(UIColor *)backgroundColor;

@end

