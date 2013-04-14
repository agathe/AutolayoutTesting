//
//  TableViewCell1.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/29/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "TableViewCell1.h"

@implementation TableViewCell1

static CGFloat allFontSize = 10.0;

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
    self.translatesAutoresizingMaskIntoConstraints = YES;
    self.contentView.translatesAutoresizingMaskIntoConstraints = YES;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.contentView.backgroundColor = [UIColor yellowColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:label];

    [label setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [label setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];
    label.backgroundColor = [UIColor whiteColor];
    label.text = @"hello";
    label.font = [UIFont systemFontOfSize:allFontSize];
    self.label = label;
    
    NSLog(@"%@", [self.contentView constraintsAffectingLayoutForAxis:UILayoutConstraintAxisVertical]);
}

//- (void)updateConstraints
//{
//    [super updateConstraints];
//    NSLog(@"here");
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)fontSize
{
    return allFontSize;
}

+ (void)setFontSize:(CGFloat)fontSize
{
    allFontSize = fontSize;
}

+ (CGFloat)heightForCell
{
    return allFontSize *2.0;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.label.font = [UIFont systemFontOfSize:allFontSize];
    
}

@end
