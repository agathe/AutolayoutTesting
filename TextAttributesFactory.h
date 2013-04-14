//
//  TextSplitter.h
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/2/13.
//  Copyright (c) 2013. All rights reserved.
//

@interface TextAttributesFactory : NSObject

+ (NSAttributedString*)attributedStringForStrings:(NSArray*)parts;


+ (void)initializePartAttributes;

+ (void)setPart1Attributes:(NSDictionary*)dictionary;
+ (NSDictionary*)part1Attributes;
+ (NSMutableDictionary*)part1AttributesValues;

+ (void)setPart3Attributes:(NSDictionary*)dictionary;
+ (NSDictionary*)part3Attributes;
+ (NSMutableDictionary*)part3AttributesValues;


@end
