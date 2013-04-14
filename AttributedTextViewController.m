//
//  AttributedTextViewController.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/2/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "AttributedTextViewController.h"
#import "TTTAttributedLabel.h"
#import "TextAttributesFactory.h"
#import "AttributedTableViewCell.h"


@interface AttributedTextViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) TTTAttributedLabel *textView1;
@property (strong, nonatomic) NSAttributedString *attributedString;

- (IBAction)textChanged:(id)sender;

@end

@implementation AttributedTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        self.title = NSLocalizedString(@"table text", @"");
    }
    return self;
}

/**
 * We want to change the font and the text displayed in a table view cell
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    [TextAttributesFactory initializePartAttributes];
    
    
    [self addTextView1];
    [self addTableView];

}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"scv6");
}

- (void)addTextView1
{
    CGRect frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, 100.0 );
    TTTAttributedLabel *view = [[TTTAttributedLabel alloc] initWithFrame:frame];
    view.lineBreakMode = NSLineBreakByWordWrapping;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor blackColor];
    self.textView1 = view;
    
    [self.view addSubview:view];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[view(==200)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    NSDictionary *dic = @{@"view": view, @"bottomView":self.bottomView};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomView]-[view]" options:0 metrics:nil views:dic]];
    [self textChanged:@"Try something here ;  and here"];
    self.inputText.text = @"Try something here ; and here";
    [self.tableView reloadData];
}

- (void)addTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    NSDictionary *dic = @{@"tableView": self.tableView, @"textView":self.textView1, @"bottomView": self.bottomView};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[textView]-[tableView]-|" options:0 metrics:nil views:dic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomView]-[tableView]-|"
                                                                      options:0 metrics:nil views:dic]];
    
    [self.tableView registerClass:[AttributedTableViewCell class] forCellReuseIdentifier:@"cell1"];
}

- (void)changedTextInTextView1:(NSString*)title andArtist:(NSString*)artist
{
    NSAttributedString *attString = [TextAttributesFactory attributedStringForStrings:@[title, artist]];
    [self.textView1 setText: attString];
    self.textView1.numberOfLines = [self.textView1 intrinsicNumberOfLines];
    self.attributedString = attString;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textChanged:(NSString*)string
{
    NSArray *twoLines = [string componentsSeparatedByString:@";"];
    NSString *title = twoLines.count>0 ? [twoLines objectAtIndex:0] : @"";
    NSString *artist = twoLines.count>1 ? [twoLines objectAtIndex:1] : @"";
    [self changedTextInTextView1:title andArtist:artist];
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    [self textChanged:newString];
    return YES;
}
- (IBAction)part1FontPlus:(id)sender {
    [self changeAttributeFontSize:+2.0 withSelectorGet:@selector(part1AttributesValues) withSelectorSet:@selector(setPart1Attributes:)];
}
- (IBAction)part1FontMinus:(id)sender {
    [self changeAttributeFontSize:-2.0 withSelectorGet:@selector(part1AttributesValues) withSelectorSet:@selector(setPart1Attributes:)];
}
- (IBAction)part3FontPlus:(id)sender {
    [self changeAttributeFontSize:+2.0 withSelectorGet:@selector(part3AttributesValues) withSelectorSet:@selector(setPart3Attributes:)];
}
- (IBAction)part3FontMinus:(id)sender {
    [self changeAttributeFontSize:-2.0 withSelectorGet:@selector(part3AttributesValues) withSelectorSet:@selector(setPart3Attributes:)];
}

- (void)changeAttributeFontSize:(CGFloat)increment withSelectorGet:(SEL)selectorGet withSelectorSet:(SEL)selectorSet
{
    [self.inputText resignFirstResponder];

    NSMutableDictionary *atts = [TextAttributesFactory performSelector:selectorGet];
    CGFloat size = [[atts valueForKey:@"fontSize"] floatValue];
    size += increment;
    if (size<0) {
        size = 0;
    }
    [atts setValue:[NSNumber numberWithFloat:size] forKey:@"fontSize"];
    [TextAttributesFactory performSelector:selectorSet withObject:atts];
    [self textChanged:self.inputText.text ];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AttributedTableViewCell *cell = (AttributedTableViewCell*) [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    NSArray *twoLines = [self.inputText.text componentsSeparatedByString:@";"];
    NSString *title = twoLines.count>0 ? [twoLines objectAtIndex:0] : @"";
    title = [title stringByAppendingFormat:@" %d", indexPath.row];
    NSString *artist = twoLines.count>1 ? [twoLines objectAtIndex:1] : @"";
    artist = [artist stringByAppendingFormat:@" %d", indexPath.row];
    BOOL even = indexPath.row & 0x01 ? NO : YES;
    if (!even) {
        NSMutableString *s = [[NSMutableString alloc] init];
        char c = 'a';
        for (NSInteger i=0; i<indexPath.row; i++) {
            [s appendFormat:@"%c", c ];
            if (i%6==0) {
                [s appendFormat:@" "];
                c += 1;
            }
        }
        title = [title stringByAppendingFormat:@" (%@)", s];
        artist = [artist stringByAppendingFormat:@" %@", s];
    }
    NSAttributedString *attString = [TextAttributesFactory attributedStringForStrings:@[title, artist]];

//    cell.backgroundColor = [UIColor blackColor];
//    cell.backgroundView.backgroundColor =[UIColor blackColor];
//    NSString *string = [NSString stringWithFormat:@"Cell %d", indexPath.row];

    [cell setAttributedString:attString];
    [cell setAttributedString2:attString];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL even = indexPath.row & 0x01 ? NO : YES;
    return even  ? 55.0 : 300.0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.inputText resignFirstResponder];
}




@end
