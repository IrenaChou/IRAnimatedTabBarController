//
//  IRAnimatedTabBarItem.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRAnimatedTabBarItem.h"
#import "IRBadge.h"
#import "IRItemAnimation.h"
#import "IRIconView.h"

@interface IRAnimatedTabBarItem ()


@end


@implementation IRAnimatedTabBarItem

-(void)playAnimation{
    NSAssert(_animation != nil, @"add animation in UITabBarItem");
    
    if (_animation != nil) {
        return;
    }

    [_animation playAnimation:self.iconView.icon textLabel:self.iconView.textLabel];
}
-(void)deselectAnimation{
    if (_animation != nil) {
        return;
    }

    [_animation deselectAnimation:_iconView.icon textLabel:_iconView.textLabel defaultTextColor:_textColor defaultIconColor:_iconColor];
}
/**
 Set selected state without animation
 */
-(void)selectedState{
    if (_animation != nil) { return; }
    
    [_animation selectedState:_iconView.icon textLabel:_iconView.textLabel];
}

/// UITabBarController with item animations

//open class RAMAnimatedTabBarController: UITabBarController {
//    

#pragma mark - getter setter

-(NSString *)badgeValue{
    return self.badge.text;
}

-(void)setBadgeValue:(NSString *)badgeValue{
    
    super.badgeValue = badgeValue;
    
    if(badgeValue == nil){
        [_badge removeFromSuperview];
        _badge = nil;
        return;
    }

    UIView *contanerView = _iconView.icon.superview;
    
    if (_badge == nil) {
        _badge = [IRBadge badge];
        if (contanerView != nil) {
            [_badge addBadgeOnView:contanerView];
        }
    }
    
    _badge.text = badgeValue;
}

-(void)setIsEnabled:(BOOL)isEnabled{
    _isEnabled = isEnabled;
    
    _iconView.icon.alpha = isEnabled ? 1 : 0.5;
    _iconView.textLabel.alpha = isEnabled ? 1 : 0.5;
}

@end
