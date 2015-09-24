//
//  JSONConversionUtil.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "JSONConversionUtil.h"
#import "AcronymsAppUtil.h"

@implementation JSONConversionUtil

+(NSArray*) convertJSONDataToDictionary:(NSData*) jsonData
{
    NSError* error;
    if(!jsonData || jsonData.length == 0)
        return nil;
    
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    DLog(@"Json Array %@",jsonArray);
    return jsonArray;
}
@end
