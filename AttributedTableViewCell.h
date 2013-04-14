//
//  AttributedTableViewCell.h
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/2/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+FixUITableViewCellAutolayout.h"

@interface AttributedTableViewCell : UITableViewCell

- (void)setAttributedString:(NSAttributedString*)string;
- (void)setAttributedString2:(NSAttributedString*)string;

@end
