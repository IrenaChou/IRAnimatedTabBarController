//
//  IRAnimatedTabBarItem.h
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IRBadge,IRItemAnimation,IRIconView;

//struct IRIconView {
//   __unsafe_unretained UIImageView *icon;
//   __unsafe_unretained UILabel *textLabel;
//};

@interface IRAnimatedTabBarItem : UITabBarItem
@property (nonatomic, strong) UIColor *bgDefaultColor;
@property (nonatomic, strong) UIColor *bgSelectedColor;

@property (nonatomic, strong) IRBadge *badge;

@property (nonatomic, strong)IRIconView* iconView;

@property (nonatomic, assign) CGFloat yOffSet;

@property (nonatomic, assign) BOOL isEnabled;

@property (nonatomic, strong) IRItemAnimation *animation;

/// The font used to render the UITabBarItem text.
//open var textFont: UIFont = UIFont.systemFont(ofSize: 10)
@property (nonatomic, strong) UIFont *textFont;

/// The color of the UITabBarItem text.
//@IBInspectable open var textColor: UIColor = UIColor.black
@property (nonatomic, strong) UIColor *textColor;

/// The tint color of the UITabBarItem icon.
//@IBInspectable open var iconColor: UIColor = UIColor.clear // if alpha color is 0 color ignoring
@property (nonatomic, strong) UIColor *iconColor;

-(void)playAnimation;
-(void)deselectAnimation;
-(void)selectedState;
@end

