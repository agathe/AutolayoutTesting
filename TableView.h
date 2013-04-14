//
//  TableView.h
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/1/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableView : UITableView
- (void)reloadDataWithCompletion:(void(^)())block;

@end
