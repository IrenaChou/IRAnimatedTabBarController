//
//  IRItemAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRItemAnimation.h"

@interface IRItemAnimation ()<IRItemAnimationDelegate>

@end

@implementation IRItemAnimation

-(instancetype)init{
    if (self = [super init]) {
        self.duration = 0.5;
        self.textSelectedColor = [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
    }
    return self;
}

-(void)playAnimation:(UIImageView*)icon textLabel:(UILabel*)textLabel{}


-(void)deselectAnimation:(UIImageView*)icon
               textLabel:(UILabel*)textLabel
        defaultTextColor:(UIColor*)defaultTextColor
        defaultIconColor:(UIColor*)defaultIconColor{}


-(void)selectedState:(UIImageView*)icon textLabel:(UILabel*)textLabel{}
@end
