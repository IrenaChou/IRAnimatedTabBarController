//
//  IRBounceAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRBounceAnimation.h"

@implementation IRBounceAnimation
/**
 Start animation, method call when UITabBarItem is selected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self playBounceAnimation:icon];
    textLabel.textColor = self.textSelectedColor;
}

/**
 Start animation, method call when UITabBarItem is unselected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 - parameter defaultTextColor: default UITabBarItem text color
 - parameter defaultIconColor: default UITabBarItem icon color
 */
-(void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor defaultIconColor:(UIColor *)defaultIconColor{
    
    textLabel.textColor = self.textSelectedColor;
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
        
       UIImageRenderingMode renderMode = defaultIconColor.CIColor.alpha == 0 ? UIImageRenderingModeAlwaysOriginal : UIImageRenderingModeAlwaysTemplate;
        
        UIImage *renderImage = [iconImage imageWithRenderingMode:renderMode];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
}

/**
 Method call when TabBarController did load
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    textLabel.textColor = self.textSelectedColor;
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
        UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
}

-(void)playBounceAnimation:(UIImageView*)icon{
     CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:k_AnimationKeys_Scale];
    
    bounceAnimation.values = @[@1.0 ,@1.4, @0.9, @1.15, @0.95, @1.02, @1.0];
    bounceAnimation.duration = self.duration;
    bounceAnimation.calculationMode = kCAAnimationCubicPaced;
    [icon.layer addAnimation:bounceAnimation forKey:nil];
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
       UIImage *renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
}

@end
