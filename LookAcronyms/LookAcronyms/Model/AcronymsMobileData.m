//
//  AcronymsMobileData.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsMobileData.h"

@implementation AcronymsMobileData

-(instancetype) initWithErrorCode:(int) code message:(NSString*) message
{
    self = [super init];
    
    if(self)
    {
        _error = [[AcronymsError alloc] initWithErrorCode:code message:message];
    }
    
    return self;
}
@end
