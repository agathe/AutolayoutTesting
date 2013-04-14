//
//  InfoViewViewController.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/29/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "InfoViewViewController.h"
#import "View1.h"
#import "View2.h"

@interface InfoViewViewController ()
@property (weak, nonatomic) IBOutlet View2 *view1;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftButton;
@property (weak, nonatomic) IBOutlet UIView *bottomRightButton;

@end

@implementation InfoViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = NSLocalizedString(@"info 3", @"");

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"sv3 ");
    NSLog(@"view 1 %@", NSStringFromCGRect(self.view1.frame));
    NSLog(@"left button %@", NSStringFromCGRect(self.bottomLeftButton.frame));
    NSLog(@"right button %@", NSStringFromCGRect(self.bottomRightButton.frame));
}

@end
