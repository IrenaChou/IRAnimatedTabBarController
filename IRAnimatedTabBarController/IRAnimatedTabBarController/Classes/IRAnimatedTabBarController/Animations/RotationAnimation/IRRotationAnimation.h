//
//  IRRotationAnimation.h
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRItemAnimation.h"
typedef enum : NSUInteger {
    IRRotationDirection_Left,
    IRRotationDirection_Right,
} IRRotationDirection;

@interface IRRotationAnimation : IRItemAnimation

@property (nonatomic, assign) IRRotationDirection direction;

@end
