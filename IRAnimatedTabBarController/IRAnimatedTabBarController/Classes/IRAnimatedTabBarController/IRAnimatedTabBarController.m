//
//  IRAnimatedTabBarController.m
//  IRAnimatedTabBarController
//
//  Created by qiaoqiao on 2017/6/9.
//  Copyright © 2017年 irena. All rights reserved.
//

#import "IRAnimatedTabBarController.h"
#import "IRAnimatedTabBarItem.h"
#import "IRItemAnimation.h"
#import "IRIconView.h"

@interface IRAnimatedTabBarController ()

@property (nonatomic, assign) BOOL didInit;
@property (nonatomic, assign) BOOL didLoadView;

@end

@implementation IRAnimatedTabBarController

/**
 Change selected color for each UITabBarItem

 - parameter textSelectedColor: set new color for text
 - parameter iconSelectedColor: set new color for icon
 */
-(void)changeSelectedColor:(UIColor *)textSelectedColor iconSelectedColor:(UIColor*)iconSelectedColor{
    
    NSArray* items = self.tabBar.items;

    for (int index = 0; index <= [items count]; index++) {
        IRAnimatedTabBarItem* item = items[index];
        item.animation.textSelectedColor = textSelectedColor;
        item.animation.iconSelectedColor = iconSelectedColor;

        if(item == self.tabBar.selectedItem){
            [item selectedState];
        }
    }
}

/**
 Hide UITabBarController

 - parameter isHidden: A Boolean indicating whether the UITabBarController is displayed
 */
-(void)animationTabBarHidden:(BOOL)isHidden{
    NSArray* items = self.tabBar.items;
    NSAssert(items, @"items must inherit IRAnimatedTabBarItem");
    
    for (IRAnimatedTabBarItem* item in items) {
        IRIconView *iconView = item.iconView;
        if(iconView){
            iconView.icon.superview.hidden = isHidden;
        }
    }
    self.tabBar.hidden = isHidden;
}


/**
 Selected UITabBarItem with animaton

 - parameter from: Index for unselected animation
 - parameter to:   Index for selected animation
 */
-(void)setSelectedIndex:(NSUInteger)from to:(NSUInteger)to{
    self.selectedIndex = to;
    NSArray *items = self.tabBar.items;
    if (!items) {
        NSAssert(NO, @"items must inherit IRAnimatedTabBarItem");
    }
    IRAnimatedTabBarItem* fromTabBarItem = (IRAnimatedTabBarItem*)items[from];
    
    UIView* containerFromView = fromTabBarItem.iconView.icon.superview;
    containerFromView.backgroundColor = fromTabBarItem.bgSelectedColor;
    
    [fromTabBarItem playAnimation];    
}
/**
 Returns a newly initialized view controller with the nib file in the specified bundle.

 - parameter nibNameOrNil:   The name of the nib file to associate with the view controller. The nib file name should
 not contain any leading path information. If you specify nil, the nibName property is set to nil.

 - parameter nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the
 bundle's language-specific project directories first, followed by the Resources directory. If this parameter is nil,
 the method uses the heuristics described below to locate the nib file.

 - returns: A newly initialized RAMAnimatedTabBarController object.
 */
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.didInit = true;
//        self.initializeContainers();
    }
    return self;
}

/**
 Returns a newly initialized view controller with the nib file in the specified bundle.

 - parameter viewControllers: Sets the root view controllers of the tab bar controller.

 - returns: A newly initialized RAMAnimatedTabBarController object.
 */
-(instancetype)initWithViewControllers:(NSArray<UIViewController*>*) viewControllers{

    if (self = [super initWithNibName:nil bundle:nil]) {
        self.didInit = true;
        [self setViewControllers:viewControllers animated:NO];
        //    self.initializeContainers()
    }
    return self;
}

/**
 Returns a newly initialized view controller with the nib file in the specified bundle.

 - parameter aDecoder: An unarchiver object.

 - returns: A newly initialized RAMAnimatedTabBarController object.
 */
//    required public init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        self.didInit = true
//        self.initializeContainers()
//    }
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.didInit = true;
//        self.initializeContainers()
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.didLoadView = true;
//        self.initializeContainers()
}

//    fileprivate func initializeContainers() {
//        if !self.didInit || !self.didLoadView {
//            return
//        }
//
//        let containers = self.createViewContainers()
//
//        self.createCustomIcons(containers)
//    }
-(void)initializeContainers{
    if (!self.didInit || !self.didLoadView) {
        return;
    }
//    let containers = self.createViewContainers()
//    self.createCustomIcons(containers)
}

// MARK: create methods

-(void)createCustomIcons:(NSDictionary*)containers{
    NSArray *items = self.tabBar.items;
    if (!items) {
        NSAssert(NO, @"items must inherit IRAnimatedTabBarItem");
    }
    
    int index = 0;
    
    for(IRAnimatedTabBarItem* item in items){
        UIImage* itemImage = item.image;
        if (!itemImage) {
            NSAssert(NO, @"add image icon in UITabBarItem");
        }
        UIView* container = containers[@"container\(items.count - 1 - index)"];
        if (!container) {
            NSAssert(NO, @"");
        }
        
        container.tag = index;
        
        UIImageRenderingMode renderMode = item.iconColor.CIColor.alpha == 0 ? UIImageRenderingModeAlwaysOriginal :
        UIImageRenderingModeAlwaysTemplate;
        
        UIImageView* icon = [[UIImageView alloc]initWithImage:[item.image imageWithRenderingMode:renderMode]];

        icon.translatesAutoresizingMaskIntoConstraints = false;
        icon.tintColor = item.iconColor;


        // text
        UILabel* textLabel = [[UILabel alloc]init];
        textLabel.text = item.title;
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = item.textColor;
        textLabel.font = item.textFont;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        IRAnimatedTabBarItem* currentItem = items[index];
        container.backgroundColor = currentItem.bgDefaultColor;
        
        [container addSubview:icon];
        
        createConstraints(icon, container: container, size: itemImage.size, yOffset: -5 - item.yOffSet)

        container.addSubview(textLabel)
        let textLabelWidth = tabBar.frame.size.width / CGFloat(items.count) - 5.0
        createConstraints(textLabel, container: container, size: CGSize(width: textLabelWidth , height: 10), yOffset: 16 - item.yOffSet)
}

//
//            if item.isEnabled == false {
//                icon.alpha      = 0.5
//                textLabel.alpha = 0.5
//            }
//            item.iconView = (icon:icon, textLabel:textLabel)
//
//            if 0 == index { // selected first elemet
//                item.selectedState()
//                container.backgroundColor = (items as [RAMAnimatedTabBarItem])[index].bgSelectedColor
//            }
//
//            item.image = nil
//            item.title = ""
//            index += 1
//        }
//    }
//
}
-(void)createConstraints:(UIView*)view container:(UIView*)container containersize:(CGSize)containersize yOffset:(CGFloat)yOffset{
    
    NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:container attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    [container addConstraint:constX];

//    let constY = NSLayoutConstraint(item: view,
//                                    attribute: NSLayoutAttribute.centerY,
//                                    relatedBy: NSLayoutRelation.equal,
//                                    toItem: container,
//                                    attribute: NSLayoutAttribute.centerY,
//                                    multiplier: 1,
//                                    constant: yOffset)
//    container.addConstraint(constY)
//
//    let constW = NSLayoutConstraint(item: view,
//                                    attribute: NSLayoutAttribute.width,
//                                    relatedBy: NSLayoutRelation.equal,
//                                    toItem: nil,
//                                    attribute: NSLayoutAttribute.notAnAttribute,
//                                    multiplier: 1,
//                                    constant: size.width)
//    view.addConstraint(constW)
//
//    let constH = NSLayoutConstraint(item: view,
//                                    attribute: NSLayoutAttribute.height,
//                                    relatedBy: NSLayoutRelation.equal,
//                                    toItem: nil,
//                                    attribute: NSLayoutAttribute.notAnAttribute,
//                                    multiplier: 1,
//                                    constant: size.height)
//    view.addConstraint(constH)
    
}
//    fileprivate func createConstraints(_ view:UIView, container:UIView, size:CGSize, yOffset:CGFloat) {
//

//
//    fileprivate func createViewContainers() -> NSDictionary {
//
//        guard let items = tabBar.items else {
//            fatalError("add items in tabBar")
//        }
//
//        var containersDict = [String: AnyObject]()
//
//        for index in 0..<items.count {
//            let viewContainer = createViewContainer()
//            containersDict["container\(index)"] = viewContainer
//        }
//
//        var formatString = "H:|-(0)-[container0]"
//        for index in 1..<items.count {
//            formatString += "-(0)-[container\(index)(==container0)]"
//        }
//        formatString += "-(0)-|"
//        let  constranints = NSLayoutConstraint.constraints(withVisualFormat: formatString,
//                                                           options:NSLayoutFormatOptions.directionRightToLeft,
//                                                           metrics: nil,
//                                                           views: (containersDict as [String : AnyObject]))
//        view.addConstraints(constranints)
//
//        return containersDict as NSDictionary
//    }
//
//    fileprivate func createViewContainer() -> UIView {
//        let viewContainer = UIView();
//        viewContainer.backgroundColor = UIColor.clear // for test
//        viewContainer.translatesAutoresizingMaskIntoConstraints = false
//        viewContainer.isExclusiveTouch = true
//        view.addSubview(viewContainer)
//
//        // add gesture
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(RAMAnimatedTabBarController.tapHandler(_:)))
//        tapGesture.numberOfTouchesRequired = 1
//        viewContainer.addGestureRecognizer(tapGesture)
//
//        // add constrains
//        let constY = NSLayoutConstraint(item: viewContainer,
//                                        attribute: NSLayoutAttribute.bottom,
//                                        relatedBy: NSLayoutRelation.equal,
//                                        toItem: view,
//                                        attribute: NSLayoutAttribute.bottom,
//                                        multiplier: 1,
//                                        constant: 0)
//
//        view.addConstraint(constY)
//
//        let constH = NSLayoutConstraint(item: viewContainer,
//                                        attribute: NSLayoutAttribute.height,
//                                        relatedBy: NSLayoutRelation.equal,
//                                        toItem: nil,
//                                        attribute: NSLayoutAttribute.notAnAttribute,
//                                        multiplier: 1,
//                                        constant: tabBar.frame.size.height)
//        viewContainer.addConstraint(constH)
//
//        return viewContainer
//    }
//
//    // MARK: actions
//
//    open func tapHandler(_ gesture:UIGestureRecognizer) {
//
//        guard let items = tabBar.items as? [RAMAnimatedTabBarItem],
//        let gestureView = gesture.view else {
//            fatalError("items must inherit RAMAnimatedTabBarItem")
//        }
//
//        let currentIndex = gestureView.tag
//
//        if items[currentIndex].isEnabled == false { return }
//
//        let controller = self.childViewControllers[currentIndex]
//
//        if let shouldSelect = delegate?.tabBarController?(self, shouldSelect: controller)
//            , !shouldSelect {
//                return
//            }
//
//        if selectedIndex != currentIndex {
//            let animationItem : RAMAnimatedTabBarItem = items[currentIndex]
//            animationItem.playAnimation()
//
//            let deselectItem = items[selectedIndex]
//
//            let containerPrevious : UIView = deselectItem.iconView!.icon.superview!
//            containerPrevious.backgroundColor = items[currentIndex].bgDefaultColor
//
//            deselectItem.deselectAnimation()
//
//            let container : UIView = animationItem.iconView!.icon.superview!
//            container.backgroundColor = items[currentIndex].bgSelectedColor
//
//            selectedIndex = gestureView.tag
//            delegate?.tabBarController?(self, didSelect: controller)
//
//        } else if selectedIndex == currentIndex {
//
//            if let navVC = self.viewControllers![selectedIndex] as? UINavigationController {
//                navVC.popToRootViewController(animated: true)
//            }
//        }
//    }

@end
