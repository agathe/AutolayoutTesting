//
//  FixedHeightTableViewController.h
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/1/13.
//  Copyright (c) 2013. All rights reserved.
//



@protocol TableViewDelegate <UITableViewDelegate>

- (CGSize)intrinsicContentSize;

@end


@interface FixedHeightTableViewController : UIViewController <UITableViewDataSource, TableViewDelegate>

@end
