//
//  IRFrameItemAnimation.h
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRItemAnimation.h"

@interface IRFrameItemAnimation : IRItemAnimation
/// A Boolean value indicated plaing revers animation when UITabBarItem unselected, if false image change immediately, defalut value true
@property (nonatomic, assign) BOOL isDeselectAnimation;

/// path to array of image names from plist file
@property (nonatomic, copy) NSString* imagesPath;

@end
