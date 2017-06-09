//
//  IRFrameItemAnimation.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRFrameItemAnimation.h"

@interface IRFrameItemAnimation ()

@property (nonatomic, strong) NSMutableArray *animationImages;
@property (nonatomic, strong) UIImage *selectedImage;

@end

@implementation IRFrameItemAnimation

#pragma mark - delegate

/**
 Start animation, method call when UITabBarItem is selected
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)playAnimation:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    [self playFrameAnimation:icon images:_animationImages];
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
    if (_isDeselectAnimation) {
        [self playFrameAnimation:icon images:_animationImages ];
    }
    textLabel.textColor = defaultTextColor;
}


/**
 Method call when TabBarController did load
 
 - parameter icon:      animating UITabBarItem icon
 - parameter textLabel: animating UITabBarItem textLabel
 */
-(void)selectedState:(UIImageView *)icon textLabel:(UILabel *)textLabel{
    icon.image = self.selectedImage;
    textLabel.textColor = self.textSelectedColor;
}

-(void)playFrameAnimation:(UIImageView*)icon images:(NSArray*)images{
    CAKeyframeAnimation *frameAnimation = [CAKeyframeAnimation animationWithKeyPath:k_AnimationKeys_KeyFrame];
    
    frameAnimation.duration = self.duration;
    frameAnimation.values = images;
    frameAnimation.repeatCount = 1;
//    frameAnimation.isRemovedOnCompletion = false;
    frameAnimation.fillMode = kCAFillModeForwards;
    [icon.layer addAnimation:frameAnimation forKey:nil];
    
}

#pragma mark - life cyle

-(void)awakeFromNib{
    [super awakeFromNib];
    
   NSString *path = [[NSBundle mainBundle]pathForResource:_imagesPath ofType:@"plist"];
    NSAssert(path, @"don't found plist");

    NSArray *animationImagesName = [NSArray arrayWithContentsOfFile:path];
    NSAssert(animationImagesName, @"animationImagesName error");
    
    [self createImagesArray:animationImagesName];

    // selected image
    NSString *selectedImageName = animationImagesName[[animationImagesName count] -1];
    self.selectedImage = [UIImage imageNamed:selectedImageName];
}

-(void)createImagesArray:(NSArray<NSString*> *)imageNames{
    for (NSString *name in imageNames) {
         UIImage* image = [UIImage imageNamed:name];
        [self.animationImages addObject:image];
    }
}
#pragma mark - getter setter

-(NSMutableArray *)animationImages{
    if (!_animationImages) {
        _animationImages = [NSMutableArray array];
    }
    return _animationImages;
}

/**
 Set images for keyframe animation
 
 - parameter images: images for keyframe animation
 */
/// 将UIImage数组转换成CIImage
//-(void)setAnimationImages:(NSMutableArray *)animationImages{
//    NSMutableArray *animationCIImages = [NSMutableArray array];
//    for (UIImage *image in animationImages) {
//        CIImage *ciImage = image.CIImage;
//        if (ciImage) {
//            [animationCIImages addObject:ciImage];
//        }
//    }
//    _animationImages = animationCIImages;
//}
@end
