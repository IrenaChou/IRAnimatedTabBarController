//
//  IRFlipBottomTransitionItemAnimations.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRFlipBottomTransitionItemAnimations.h"

@implementation IRFlipBottomTransitionItemAnimations
-(instancetype)init{
    if (self = [super init]) {
        self.transitionOptions = UIViewAnimationOptionTransitionFlipFromBottom;
    }
    return self;
}
@end
