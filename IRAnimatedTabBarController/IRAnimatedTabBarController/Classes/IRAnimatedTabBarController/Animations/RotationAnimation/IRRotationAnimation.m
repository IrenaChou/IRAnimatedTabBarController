//
//  IRRotationAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRRotationAnimation.h"

@interface IRRotationAnimation ()

@end

@implementation IRRotationAnimation
-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self playRoatationAnimation:icon];
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
    textLabel.textColor = defaultTextColor;

    UIImage* iconImage = icon.image;
    if(iconImage){
        UIImageRenderingMode renderMode = defaultIconColor.CIColor.alpha == 0 ? UIImageRenderingModeAlwaysOriginal :
        UIImageRenderingModeAlwaysTemplate;
        
        UIImage* renderImage = [iconImage imageWithRenderingMode:renderMode];
        icon.image = renderImage;
        icon.tintColor = defaultIconColor;
    }
}

/**
 Method call when TabBarController did load
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    textLabel.textColor = self.textSelectedColor;

    UIImage* iconImage = icon.image;
    if(iconImage){
        UIImage* renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
}

-(void)playRoatationAnimation:(UIImageView*)icon{
    CABasicAnimation* rotateAnimation = [CABasicAnimation animationWithKeyPath:k_AnimationKeys_Rotation];
    rotateAnimation.fromValue = @0.0;
    CGFloat toValue = M_PI * 2;
    
    if(self.direction == IRRotationDirection_Left){
        toValue = toValue * -1.0;
    }

    rotateAnimation.toValue = [NSNumber numberWithFloat:toValue];
    rotateAnimation.duration = self.duration;

    [icon.layer addAnimation:rotateAnimation forKey:nil];
    
    UIImage* iconImage = icon.image;
    if(iconImage){
        UIImage* renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.iconSelectedColor;
    }
}
@end
