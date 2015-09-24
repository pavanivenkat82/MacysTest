//
//  AcronymsData.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsData.h"

@implementation AcronymsData

-(instancetype) initWithDictionary:(NSDictionary*) jsonDictionary
{
    self = [super init];
    
    if(self)
    {
        _abrevaition = jsonDictionary[kJSONAbbrevation];
        _frequecy = [jsonDictionary[kJSONFrequency] integerValue];
        _year = [jsonDictionary[kJSONYear] integerValue];
        
    }
    return self;
    
}
@end
