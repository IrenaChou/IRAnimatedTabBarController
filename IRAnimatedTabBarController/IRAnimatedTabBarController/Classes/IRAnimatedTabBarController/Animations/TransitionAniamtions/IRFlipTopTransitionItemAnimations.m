//
//  IRFlipTopTransitionItemAnimations.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRFlipTopTransitionItemAnimations.h"

@implementation IRFlipTopTransitionItemAnimations
-(instancetype)init{
    if (self = [super init]) {
        self.transitionOptions = UIViewAnimationOptionTransitionFlipFromTop;
    }
    return self;
}
@end
