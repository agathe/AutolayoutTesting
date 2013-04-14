//
//  Scrollview1ViewController.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/27/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "Scrollview1ViewController.h"
#import "View1.h"

@interface Scrollview1ViewController ()


@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *contentViewConstraints;

@end

@implementation Scrollview1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = NSLocalizedString(@"scrollview 1", @"");
    }
    return self;
}

/**
 * The contentview has one variable size element - the white view at the top.
 * The white and blue views are separated by a fixed spacing. The blue view does not grow vertically.
 * the content view needs to be as wide as the scrollview, and at least as high
 * as the scrollview +1.0
 * We want the scrollview to always scroll. 
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.scrollView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[scrollView]|" options:0 metrics:nil views:@{@"scrollView": self.scrollView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:@{@"scrollView": self.scrollView}]];

    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;

    if (self.contentViewConstraints.count>0) {
        [self.contentView removeConstraints:self.contentViewConstraints];
    }
    
    [self.scrollView addSubview:self.contentView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[self]|" options:0 metrics:0 views:@{@"self": self.contentView}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:0 views:@{@"self": self.contentView}]];
    
    
    NSLayoutConstraint *constHeight = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1.0];
    constHeight.priority = UILayoutPriorityDefaultHigh;
    [self.view addConstraint:constHeight];
    
    NSLayoutConstraint *constHeightGrowing = [NSLayoutConstraint constraintWithItem:self.contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:1.0];
    constHeight.priority = UILayoutPriorityDefaultLow;
    [self.view addConstraint:constHeightGrowing];
    
    // subview
    View1 *view1 = [[View1 alloc] init]; // has a content size
    view1.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:view1];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[view1]-8-|" options:0 metrics:nil views:@{@"view1": view1}]];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[view1]" options:0 metrics:nil views:@{@"view1": view1}]];
    
    // second subview at the bottom
    View1 *view2 = [[View1 alloc] init];
    view2.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:view2];
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[view2]-8-|" options:0 metrics:nil views:@{@"view2": view2}]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view2]-8-|" options:0 metrics:nil views:@{@"view2": view2}]];
    
//    [view2 setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical]; // commenting this line makes the layout ambiguous
    
    // space out the subviews, which makes the contentview grow vertically
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1]-400-[view2]" options:0 metrics:nil views:@{@"view2": view2, @"view1": view1}]];
    view1.con

    /**
     no ambiguous layout
     (lldb) po [[UIWindow keyWindow] _autolayoutTrace]
     $0 = 0x0fd75630
     *<UIWindow:0xfd7a7d0>
     |   *<UILayoutContainerView:0x754b120>
     |   |   *<UITransitionView:0x754c2e0>
     |   |   |   *<UIViewControllerWrapperView:0x7556ce0>
     |   |   |   |   *<UIView:0x7553f60>
     |   |   |   |   |   *<UIScrollView:0x7553530>
     |   |   |   |   |   |   *<UIView:0x7553be0>
     |   |   |   |   |   |   |   *<View1:0x7556030>
     |   |   |   |   |   |   |   *<View1:0x7556740>
     |   |   <UITabBar:0x754b380>
     |   |   |   <_UITabBarBackgroundView:0x754b050>
     |   |   |   <UIImageView:0x754bdb0>
     |   |   |   <UITabBarButton:0x754cf80>
     |   |   |   |   <UITabBarSelectionIndicatorView:0x75515e0>
     |   |   |   |   <UITabBarSwappableImageView:0x754feb0>
     |   |   |   |   <UITabBarButtonLabel:0x754df00>
     |   |   |   <UITabBarButton:0x7550930>
     |   |   |   |   <UITabBarSwappableImageView:0x7550fe0>
     |   |   |   |   <UITabBarButtonLabel:0x75509f0>
     
     */
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"sv1 ");
}


@end
