//
//  IRBadge.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRBadge.h"

@implementation IRBadge

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        self.layer.backgroundColor = [UIColor redColor].CGColor;
        self.layer.cornerRadius = frame.size.width / 2;

        [self configureNumberLabel];
        
        self.translatesAutoresizingMaskIntoConstraints = NO;

        [self createSizeConstraints:frame.size];
    }
    return self;
}


/**
 设置本view的宽高约束

 @param size 宽高
 */
-(void)createSizeConstraints:(CGSize)size{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.width];
    
    [self addConstraint:widthConstraint];
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:size.height];
    
    [self addConstraint:heightConstraint];
}

/**
 设置badge显示文字样式
 */
-(void)configureNumberLabel{
    self.textAlignment = NSTextAlignmentCenter;
    self.font = [UIFont systemFontOfSize:13];
    self.textColor = [UIColor whiteColor];
}


/**
 工厂方法 快速创建类

 @return IRBadge实例
 */
+(instancetype)badge{
    IRBadge *tempBadge = [[IRBadge alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    return tempBadge;
}

/**
 将badge添加到onView

 @param onView targetView
 */
-(void)addBadgeOnView:(UIView*)onView{
    [onView addSubview:self];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:onView attribute:NSLayoutAttributeTop multiplier:1 constant:3];
    
    [onView addConstraint:topConstraint];
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:onView attribute:NSLayoutAttributeCenterX multiplier:1 constant:10];
    
    [onView addConstraint:centerXConstraint];
}

#pragma mark - getter setter

-(CGSize)intrinsicContentSize{
    CGSize contentSize = super.intrinsicContentSize;
    contentSize.width += 10.0;
    return contentSize;
}
@end
