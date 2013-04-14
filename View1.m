//
//  View1.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/27/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "View1.h"

@implementation View1

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        [self setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    }
    return self;
}


- (CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, 80.0);
}


@end
