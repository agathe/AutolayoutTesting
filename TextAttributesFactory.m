//
//  TextSplitter.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 4/2/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "TextAttributesFactory.h"
#import "AttributedStringView.h"

static NSDictionary *part1Attributes;
static NSMutableDictionary *part1AttributesValues;

static NSDictionary *part3Attributes;
static NSMutableDictionary *part3AttributesValues;

@implementation TextAttributesFactory


+ (NSAttributedString*)attributedStringForStrings:(NSArray*)parts
{

    
    NSMutableAttributedString *cellString = [[NSMutableAttributedString alloc]
                                             initWithString:@""
                                             attributes:[TextAttributesFactory part1Attributes]];
    NSString *string;
    string = [parts objectAtIndex:0];
    if (string.length>0) {
        [cellString appendAttributedString:[[NSAttributedString alloc] initWithString:string
                           attributes:[TextAttributesFactory part1Attributes]]];
    }
    if (cellString.length>0) {
        [cellString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"
                           attributes:[TextAttributesFactory part1Attributes]]];
    }
    if (parts.count>1) {
        string = [parts objectAtIndex:1];
        if (cellString.length>0) {
            [cellString appendAttributedString:[[NSAttributedString alloc] initWithString:string
                                                                               attributes:[TextAttributesFactory part3Attributes]]];
        }
        
    }
    
    return cellString;
}

+ (void)initializePartAttributes
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                       @"Helvetica Bold", @"fontName",
                       [NSNumber numberWithFloat:24.0], @"fontSize",
                       [UIColor whiteColor], @"color",
                       [NSNumber numberWithInt:kCTLineBreakByWordWrapping], @"lineBreaking",
                       nil];
    [TextAttributesFactory setPart1Attributes:dictionary];
    [dictionary setValue:@"Helvetica" forKey:@"fontName"];
    [dictionary setValue:[NSNumber numberWithFloat:16.0] forKey:@"fontSize"];
    [TextAttributesFactory setPart3Attributes:dictionary];
}

+ (NSDictionary*)attributeDictionaryForAttributeValues:(NSDictionary*)dictionary
{
    NSString *fontName = [dictionary objectForKey:@"fontName"];
    NSNumber *fontSize =[dictionary objectForKey:@"fontSize"];
    UIColor *color = [dictionary objectForKey:@"color"];
    NSNumber *lineBreaking = [dictionary objectForKey:@"lineBreaking"];
    NSDictionary * atts = [AttributedStringView fontAttributesDictionaryForFontName:fontName
                                                                                         size:fontSize.floatValue
                                                                                        color:color
                                                                                    linebreak:lineBreaking.intValue];
    return atts;
}
+ (void)setPart1Attributes:(NSDictionary*)dictionary
{
    @synchronized(self) {
        part1AttributesValues = [dictionary mutableCopy];
        part1Attributes = [TextAttributesFactory attributeDictionaryForAttributeValues:dictionary];
    }
}

+ (NSMutableDictionary*)part1AttributesValues
{
    return part1AttributesValues;
}
+ (NSMutableDictionary*)part3AttributesValues
{
    return part3AttributesValues;
}

+ (NSDictionary*)part1Attributes
{
    return part1Attributes;
}



+ (void)setPart3Attributes:(NSDictionary*)dictionary
{
    @synchronized(self) {
        part3AttributesValues = [dictionary mutableCopy];
        part3Attributes = [TextAttributesFactory attributeDictionaryForAttributeValues:dictionary];
    }
}

+ (NSDictionary*)part3Attributes
{
    return part3Attributes;
}




@end
