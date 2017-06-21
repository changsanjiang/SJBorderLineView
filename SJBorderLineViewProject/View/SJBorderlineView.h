//
//  SJBorderlineView.h
//  SJLine
//
//  Created by BlueDancer on 2017/6/11.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SJBorderlineType) {
    SJBorderlineTypeTop,
    SJBorderlineTypeLeading,
    SJBorderlineTypeTrailing,
    SJBorderlineTypeBottom,
};

@interface SJBorderlineView : UIView

+ (instancetype)borderlineViewWithType:(SJBorderlineType)type startMargin:(CGFloat)startMargin endMargin:(CGFloat)endMargin lineColor:(UIColor *)color;

@end
