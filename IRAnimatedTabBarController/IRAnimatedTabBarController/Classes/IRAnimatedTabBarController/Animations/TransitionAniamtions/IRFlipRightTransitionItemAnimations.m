//
//  IRFlipRightTransitionItemAnimations.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRFlipRightTransitionItemAnimations.h"

@implementation IRFlipRightTransitionItemAnimations
-(instancetype)init{
    if (self = [super init]) {
        self.transitionOptions = UIViewAnimationOptionTransitionFlipFromRight;
    }
    return self;
}
@end
