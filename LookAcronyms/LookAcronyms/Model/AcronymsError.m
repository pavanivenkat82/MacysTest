//
//  AcronymsError.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsError.h"

@implementation AcronymsError

-(instancetype) initWithErrorCode:(NSInteger) errorCode message:(NSString*) message
{
    self = [super init];
    
    if(self)
    {
        _code = errorCode;
        _message = message;
    }
    
    return self;
}

@end
