//
//  IRAnimatedTabBarController.h
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRAnimatedTabBarController : UITabBarController

/**
 Change selected color for each UITabBarItem
 
 - parameter textSelectedColor: set new color for text
 - parameter iconSelectedColor: set new color for icon
 */
-(void)changeSelectedColor:(UIColor *)textSelectedColor iconSelectedColor:(UIColor*)iconSelectedColor;

/**
 Hide UITabBarController
 
 - parameter isHidden: A Boolean indicating whether the UITabBarController is displayed
 */
-(void)animationTabBarHidden:(BOOL)isHidden;

/**
 Selected UITabBarItem with animaton
 
 - parameter from: Index for unselected animation
 - parameter to:   Index for selected animation
 */
-(void)setSelectedIndex:(NSUInteger)from to:(NSUInteger)to;

/**
 Returns a newly initialized view controller with the nib file in the specified bundle.
 
 - parameter viewControllers: Sets the root view controllers of the tab bar controller.
 
 - returns: A newly initialized RAMAnimatedTabBarController object.
 */
-(instancetype)initWithViewControllers:(NSArray<UIViewController*>*) viewControllers;

@end
