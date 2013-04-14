//
//  TableViewController.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/29/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell1.h"

@interface TableViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *badConstraints;
- (IBAction)biggerFontClick:(id)sender;
- (IBAction)smallerFontClick:(id)sender;

@end

@implementation TableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = NSLocalizedString(@"table", @"");
    }
    return self;
}

/**
 * The font size changes in the table view cell
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.backgroundColor = [UIColor blueColor];
    [self.view removeConstraints:self.badConstraints];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-8-[tableView]-8-|" options:0 metrics:nil views:@{@"tableView": self.tableView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-8-[button1(>=100)]-16-[tableView]-8-|" options:0 metrics:nil views:@{@"tableView": self.tableView,
                               @"button1": self.button1}]];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell1" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell1"];
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
    
    NSLog(@"sv4 ");
//    NSLog(@"view 1 %@", NSStringFromCGRect(self.view1.frame));
//    NSLog(@"left button %@", NSStringFromCGRect(self.bottomLeftButton.frame));
//    NSLog(@"right button %@", NSStringFromCGRect(self.bottomRightButton.frame));
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TableViewCell1 heightForCell] * (indexPath.row & 0x01 ? 1.0 : 2.0);
}


- (IBAction)biggerFontClick:(id)sender {
    CGFloat size = [TableViewCell1 fontSize] + 10.0;
    if (size>100.0) {
        size = 100.0;
    }
    [TableViewCell1 setFontSize:size];
    [self.tableView reloadData];
}

- (IBAction)smallerFontClick:(id)sender {
    CGFloat size = [TableViewCell1 fontSize] - 5.0;
    if (size<10.0) {
        size = 10.0;
    }
    [TableViewCell1 setFontSize:size];
    [self.tableView reloadData];
}

@end
