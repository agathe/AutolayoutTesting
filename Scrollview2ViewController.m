//
//  Scrollview2ViewController.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/28/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "Scrollview2ViewController.h"
#import "View1.h"
#import "View2.h"

@interface Scrollview2ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet View2 *firstView;

@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *contentViewConstraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstViewFillWidthConstraint;
- (IBAction)clickButton:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lastElementBottomConstraint;

@end

@implementation Scrollview2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = NSLocalizedString(@"scrollview 2", @"");

    }
    return self;
}

/**
 * A view in the contentview can grow dynamically (when clicking the button)
 * we want the content view to adjust its size when that white view grows beyond 
 the size of the content view
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.scrollView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[scrollView]|" options:0 metrics:nil views:@{@"scrollView": self.scrollView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:@{@"scrollView": self.scrollView}]];
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
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

    // in content view
    if (self.contentViewConstraints.count>0) {
        [self.contentView removeConstraints:self.contentViewConstraints];
    }
    self.firstViewFillWidthConstraint.constant = 8.0;
    self.lastElementBottomConstraint.constant = 8.0;
    self.lastElementBottomConstraint.priority = 750;

    
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"sv2 ");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickButton:(id)sender
{
    self.firstView.numberOfLines = self.firstView.numberOfLines + 1;
}
@end
