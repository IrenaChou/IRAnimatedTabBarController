//
//  IRItemAnimation.h
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>
//struct Constants {
//    struct AnimationKeys {
//        NSString* Scale     = "transform.scale";
//        NSString* Rotation  = "transform.rotation";
//        NSString* KeyFrame  = "contents";
//        NSString* PositionY = "position.y";
//        NSString* Opacity   = "opacity";
//    }
//}
//
#define k_AnimationKeys_Scale @"transform.scale"
#define k_AnimationKeys_Rotation @"transform.rotation"
#define k_AnimationKeys_KeyFrame @"contents"
#define k_AnimationKeys_PositionY @"position.y"
#define k_AnimationKeys_Opacity @"opacity"

@protocol IRItemAnimationDelegate <NSObject>

-(void)playAnimation:(UIImageView*)icon textLabel:(UILabel*)textLabel;

-(void)deselectAnimation:(UIImageView*)icon
               textLabel:(UILabel*)textLabel
        defaultTextColor:(UIColor*)defaultTextColor
        defaultIconColor:(UIColor*)defaultIconColor;


-(void)selectedState:(UIImageView*)icon textLabel:(UILabel*)textLabel;

@end

@interface IRItemAnimation : NSObject

/// The duration of the animation
@property (nonatomic, assign) CGFloat duration;

///  The text color in selected state.
@property (nonatomic, strong) UIColor *textSelectedColor;

///  The icon color in selected state.
@property (nonatomic, strong) UIColor *iconSelectedColor;


/**
 Start animation, method call when UITabBarItem is selected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)playAnimation:(UIImageView*)icon textLabel:(UILabel*)textLabel;

/**
 Start animation, method call when UITabBarItem is unselected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 - parameter defaultTextColor: default UITabBarItem text color
 - parameter defaultIconColor: default UITabBarItem icon color
 */
-(void)deselectAnimation:(UIImageView*)icon
               textLabel:(UILabel*)textLabel
        defaultTextColor:(UIColor*)defaultTextColor
        defaultIconColor:(UIColor*)defaultIconColor;
/**
 Method call when TabBarController did load
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)selectedState:(UIImageView*)icon textLabel:(UILabel*)textLabel;
@end
