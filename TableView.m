//
//  TableView.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/1/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "TableView.h"
#import "FixedHeightTableViewController.h"

@implementation TableView

- (CGSize)intrinsicContentSize
{
    if (self.delegate) {
        id <TableViewDelegate> dlg = (id<TableViewDelegate>) self.delegate;
        if ([dlg respondsToSelector:@selector(intrinsicContentSize)]) {
            return [dlg intrinsicContentSize];
        }
    }
    return (CGSize){UIViewNoIntrinsicMetric, 200.0};
}

- (void)reloadDataWithCompletion:(void(^)())block
{
    [super reloadData];
//    [self invalidateIntrinsicContentSize];
//    [self layoutIfNeeded];
//    NSLog(@"my size %@", NSStringFromCGSize([self intrinsicContentSize]));
    if (block) {
        block();
    }
}

@end
