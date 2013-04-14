//
//  AttributedTableViewCell.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/2/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "AttributedTableViewCell.h"
#import "AttributedStringView.h"



@interface AttributedTableViewCell()
@property (nonatomic, strong ) AttributedStringView *stringView;
@property (nonatomic, strong ) AttributedStringView *stringView2;
@property (nonatomic, strong ) NSLayoutConstraint *stringView2SizeConstraint;

@end
@implementation AttributedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialize];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize
{    
    self.stringView = [[AttributedStringView alloc ] init];
    self.stringView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.stringView];
    self.clipsToBounds = YES;
    self.stringView.backgroundColor = [UIColor blackColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    


    self.stringView2 = [[AttributedStringView alloc ] init];
    self.stringView2.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.stringView2];
    self.clipsToBounds = YES;
    self.stringView2.backgroundColor = [UIColor blueColor];
    
    NSDictionary *dic = @{@"stringView" : self.stringView, @"stringView2" : self.stringView2};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-16-[stringView(==200)]-16-[stringView2(==200)]" options:0 metrics:nil views:dic]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[stringView]-(==0@980)-|" options:0 metrics:nil views:dic]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0@950)-[stringView]" options:0 metrics:nil views:dic]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0@950)-[stringView2]" options:0 metrics:nil views:dic]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[stringView2]-(==0@980)-|" options:0 metrics:nil views:dic]];
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[stringView2(==10)]" options:0 metrics:nil views:dic];
    self.stringView2SizeConstraint = [constraints objectAtIndex:0];
    [self addConstraints:constraints];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setAttributedString:(NSAttributedString*)string
{
    self.stringView.attributedString = string;
//    [self invalidateIntrinsicContentSize];
}

- (void)setAttributedString2:(NSAttributedString*)string
{
    self.stringView2.attributedString = string;
    CGFloat height = [AttributedStringView frameHeightForAttributedString:string width:self.stringView2.frame.size.width cache:self.stringView2.anyCache];
    self.stringView2SizeConstraint.constant = height;
    [self layoutIfNeeded];
}


@end
