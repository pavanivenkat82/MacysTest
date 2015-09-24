//
//  JSONConversionUtil.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>
// COnverts NSData to Dictionary using NSJSONSerialization
@interface JSONConversionUtil : NSObject

+(NSArray*) convertJSONDataToDictionary:(NSData*) jsonData;
@end
