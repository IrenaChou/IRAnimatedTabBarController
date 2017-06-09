////
////  IRTransitionItemAnimations.m
////  IRAnimatedTabBarController
////
////  Created by qiaoqiao on 2017/6/9.
////  Copyright © 2017年 irena. All rights reserved.
////
//
#import "IRTransitionItemAnimations.h"


@implementation IRTransitionItemAnimations

///  Options for animating. Default TransitionNone
-(instancetype)init{
    if (self = [super init]) {
//        self.transitionOptions = UIViewAnimationOptions;
    }
    return self;
}
/**
 Start animation, method call when UITabBarItem is selected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self selectedColor:icon textLabel:textLabel];

    [UIView transitionWithView:icon duration:self.duration options:_transitionOptions animations:^{
    } completion:^(BOOL finished) {}];
}
/**
 Start animation, method call when UITabBarItem is unselected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 - parameter defaultTextColor: default UITabBarItem text color
 - parameter defaultIconColor: default UITabBarItem icon color
 */
-(void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor defaultIconColor:(UIColor *)defaultIconColor{
    UIImage * iconImage = icon.image;
    if (iconImage) {
        UIImageRenderingMode renderMode = defaultIconColor.CIColor.alpha == 0 ? UIImageRenderingModeAlwaysOriginal :
        UIImageRenderingModeAlwaysTemplate;

        UIImage* renderImage = [iconImage imageWithRenderingMode:renderMode];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
    textLabel.textColor = self.textSelectedColor;
}

/**
 Method call when TabBarController did load
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self selectedColor:icon textLabel:textLabel];
}

-(void)selectedColor:(UIImageView*)icon textLabel:(UILabel*)textLabel{
    UIImage * iconImage = icon.image;
    if (self.iconSelectedColor != nil) {
        UIImage* renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
    textLabel.textColor = self.textSelectedColor;
}
@end
