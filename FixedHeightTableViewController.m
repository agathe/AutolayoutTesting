//
//  FixedHeightTableViewController.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/1/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "FixedHeightTableViewController.h"
#import "TableViewCell1.h"
#import "TableView.h"

@interface FixedHeightTableViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet TableView *tableView;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *badConstraints;
@property (nonatomic, assign) NSInteger number;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintBottomTableView;
- (IBAction)fewLinesPressed:(id)sender;
- (IBAction)moreLinesPressed:(id)sender;

@end

@implementation FixedHeightTableViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = NSLocalizedString(@"table lines", @"");
        self.number = 10;
    }
    return self;
}

/**
 * The number of lines in the table view changes and we want the table view
 frame to adjust to a small contentview
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.backgroundColor = [UIColor blueColor];
    if (self.badConstraints.count>0) {
        [self.view removeConstraints:self.badConstraints];
    }
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[tableView]-8-|" options:0 metrics:nil views:@{@"tableView": self.tableView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[button1]-16-[tableView]" options:0 metrics:nil views:@{@"tableView": self.tableView,
                               @"button1": self.button1}]];
    [self.tableView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [self.tableView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];

    self.constraintBottomTableView.constant = 8.0;
//    constraintBottomTableView.priority = 150.0;

    [self.tableView registerClass:[TableViewCell1 class] forCellReuseIdentifier:@"cell1"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    // po [[UIWindow keyWindow] _autolayoutTrace]
    
    NSLog(@"sv5 ");
    //    NSLog(@"view 1 %@", NSStringFromCGRect(self.view1.frame));
    //    NSLog(@"left button %@", NSStringFromCGRect(self.bottomLeftButton.frame));
    //    NSLog(@"right button %@", NSStringFromCGRect(self.bottomRightButton.frame));
    NSLog(@"c %@", self.constraintBottomTableView);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.number;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TableViewCell1 heightForCell];
}




- (IBAction)fewLinesPressed:(id)sender {
    if (self.number>2) {
        self.number -= 2;
        [self.tableView reloadDataWithCompletion:^{
            [self.tableView invalidateIntrinsicContentSize];
//            [self.tableView layoutIfNeeded];
            [self.view layoutIfNeeded];

        }];
    }
}

- (IBAction)moreLinesPressed:(id)sender {
    if (self.number<1000) {
        self.number+=3;
        [self.tableView reloadDataWithCompletion:^{
            [self.tableView invalidateIntrinsicContentSize];
            //            [self.tableView layoutIfNeeded];
            [self.view layoutIfNeeded];
            
        }];
    }
}

- (CGSize)intrinsicContentSize
{
    return (CGSize){UIViewNoIntrinsicMetric, self.number * [TableViewCell1 heightForCell]};
}


@end
