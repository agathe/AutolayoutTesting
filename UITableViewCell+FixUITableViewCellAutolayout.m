//
//  UITableViewCell+FixUITableViewCellAutolayout.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/29/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "UITableViewCell+FixUITableViewCellAutolayout.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UITableViewCell (FixUITableViewCellAutolayout)

+ (void)load
{
    Method existing = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method new = class_getInstanceMethod(self, @selector(_autolayout_replacementLayoutSubviews));
    
    method_exchangeImplementations(existing, new);
}

- (void)_autolayout_replacementLayoutSubviews
{
    [super layoutSubviews];
    [self _autolayout_replacementLayoutSubviews]; // not recursive due to method swizzling
    [super layoutSubviews];
}

@end