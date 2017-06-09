//
//  IRRightRotationAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRRightRotationAnimation.h"

@implementation IRRightRotationAnimation
-(instancetype)init{
    if (self = [super init]) {
        self.direction = IRRotationDirection_Right;
    }
    return self;
}
@end
