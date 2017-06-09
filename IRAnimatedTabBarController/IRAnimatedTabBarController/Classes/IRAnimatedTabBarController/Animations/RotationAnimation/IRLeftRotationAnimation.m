//
//  IRLeftRotationAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRLeftRotationAnimation.h"

@implementation IRLeftRotationAnimation

-(instancetype)init{
    if (self = [super init]) {
        self.direction = IRRotationDirection_Left;
    }
    return self;
}

@end
