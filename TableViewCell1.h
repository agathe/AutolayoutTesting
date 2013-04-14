//
//  TableViewCell1.h
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/29/13.
//  Copyright (c) 2013. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+FixUITableViewCellAutolayout.h"


@interface TableViewCell1 : UITableViewCell

@property (nonatomic, strong) UILabel *label;

+ (CGFloat)fontSize;
+ (void)setFontSize:(CGFloat)fontSize;
+ (CGFloat)heightForCell;

@end
