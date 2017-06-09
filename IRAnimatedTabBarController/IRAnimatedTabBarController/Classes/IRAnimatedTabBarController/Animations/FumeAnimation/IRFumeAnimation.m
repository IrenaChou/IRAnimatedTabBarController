//
//  IRFumeAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRFumeAnimation.h"

@implementation IRFumeAnimation

#pragma mark - delegate

-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
    [self playMoveIconAnimation:icon values:@[[NSNumber numberWithFloat:icon.center.y],[NSNumber numberWithFloat:icon.center.y + 4.0]]];
    
    [self playLabelAnimation:textLabel];
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
       UIImage* renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.textSelectedColor;
    }
}

-(void)deselectAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel defaultTextColor:(UIColor *)defaultTextColor defaultIconColor:(UIColor *)defaultIconColor{
    
   [self playMoveIconAnimation:icon values:@[[NSNumber numberWithFloat:icon.center.y + 4.0],[NSNumber numberWithFloat:icon.center.y]]];
    
    textLabel.textColor = defaultIconColor;
    
    UIImage *iconImage = icon.image;
    if (iconImage) {
        UIImageRenderingMode renderMode = defaultIconColor.CIColor.alpha == 0 ? UIImageRenderingModeAlwaysOriginal : UIImageRenderingModeAlwaysTemplate;
        UIImage *renderImage = [iconImage imageWithRenderingMode:renderMode];
        icon.image = renderImage;
        icon.tintColor = defaultIconColor;
    }
}

-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    
    [self playMoveIconAnimation:icon values:@[[NSNumber numberWithFloat:icon.center.y + 120.0]]];
    textLabel.alpha = 0;
    textLabel.textColor = self.textSelectedColor;
    
    UIImage* iconImage = icon.image;
    if(iconImage){
        UIImage* renderImage = [iconImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        icon.image = renderImage;
        icon.tintColor = self.textSelectedColor;
    }
}

-(void)playMoveIconAnimation:(UIImageView*)icon values:(NSArray*)values{
    CAKeyframeAnimation *yPositionAnimation = [self createAnimation:k_AnimationKeys_PositionY values:values duration:self.duration / 2];
    [icon.layer addAnimation:yPositionAnimation forKey:nil];
}

-(void)playLabelAnimation:(UILabel*)textLabel{
    
   CAKeyframeAnimation *yPositionAnimation = [self createAnimation:k_AnimationKeys_PositionY values:@[[NSNumber numberWithFloat:textLabel.center.y],[NSNumber numberWithFloat:textLabel.center.y - 60.0]] duration:self.duration];
    
    yPositionAnimation.fillMode = kCAFillModeRemoved;
//    yPositionAnimation.isRemovedOnCompletion = YES;
    [textLabel.layer addAnimation:yPositionAnimation forKey:nil];
    
    
    
    CAKeyframeAnimation *scaleAnimation = [self createAnimation:k_AnimationKeys_Scale values:@[@1.0,@2.0] duration:self.duration];
    scaleAnimation.fillMode = kCAFillModeRemoved;
    //    scaleAnimation.isRemovedOnCompletion = YES;
    [textLabel.layer addAnimation:scaleAnimation forKey:nil];
    
    
    
    CAKeyframeAnimation *opacityAnimation = [self createAnimation:k_AnimationKeys_Opacity values:@[@1.0,@0.0] duration:self.duration];
    [textLabel.layer addAnimation:opacityAnimation forKey:nil];
}
-(CAKeyframeAnimation*)createAnimation:(NSString*)keyPath values:(NSArray*)values duration:(CGFloat)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    animation.values = values;
    animation.duration = duration;
    animation.calculationMode = kCAAnimationCubic;
    animation.fillMode = kCAFillModeForwards;
//    animation.isRemovedOnCompletion = NO;
    
    return animation;
}

-(void)playDeselectLabelAnimation:(UILabel*)textLabel{
    
    CAKeyframeAnimation *yPositionAnimation = [self createAnimation:k_AnimationKeys_PositionY values:@[[NSNumber numberWithFloat:textLabel.center.y + 15],[NSNumber numberWithFloat:textLabel.center.y]] duration:self.duration];
    [textLabel.layer addAnimation:yPositionAnimation forKey:nil];

    CAKeyframeAnimation* opacityAnimation = [self createAnimation:k_AnimationKeys_Opacity values:@[@0,@1] duration:self.duration];
    [textLabel.layer addAnimation:opacityAnimation forKey:nil];
}

@end
