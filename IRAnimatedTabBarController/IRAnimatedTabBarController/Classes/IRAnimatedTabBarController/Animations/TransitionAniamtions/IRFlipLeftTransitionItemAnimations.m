//
//  IRFlipLeftTransitionItemAnimations.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRFlipLeftTransitionItemAnimations.h"

@implementation IRFlipLeftTransitionItemAnimations

-(instancetype)init{
    if (self = [super init]) {
        self.transitionOptions = UIViewAnimationOptionTransitionFlipFromLeft;
    }
    return self;
}
@end
