//
//  NSString+Encoding.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "NSString+Encoding.h"

@implementation NSString (Encoding)

-(NSString*)urlEncodedString {
    NSString* result = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, CFSTR(":/?#[]@!$&’()* +,;="), kCFStringEncodingUTF8);
    return result;
}

@end
