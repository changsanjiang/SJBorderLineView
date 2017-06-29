//
//  SJBorderlineView.h
//  SJLine
//
//  Created by BlueDancer on 2017/6/11.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SJBorderlineType) {
    SJBorderlineTypeNone     = 0,
    SJBorderlineTypeTop      = 1 << 0,
    SJBorderlineTypeLeading  = 1 << 1,
    SJBorderlineTypeTrailing = 1 << 2,
    SJBorderlineTypeBottom   = 1 << 3,
};

@interface SJBorderlineView : UIView

+ (instancetype)borderlineViewWithType:(SJBorderlineType)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color;

+ (instancetype)borderlineViewWithType:(SJBorderlineType)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color lineWidth:(CGFloat)width;

@end

