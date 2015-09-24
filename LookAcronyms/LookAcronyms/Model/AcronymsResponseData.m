//
//  AcronymsResponseData.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsResponseData.h"


@implementation AcronymsResponseData

-(instancetype) initWithArray:(NSArray*) jsonArray serviceType:(AcronymsServiceType) serviceType
{
    self = [super init];
    if(self)
    {
        _serviceType = serviceType;
        
        if(!jsonArray || [jsonArray count] == 0)
        {
            _mobileData = [[AcronymsMobileData alloc] initWithErrorCode:1000 message:@"There is some issue"];
        }
        else if (serviceType == AcronymsServiceTypeGetAcronyms)
        {
            _mobileData = [[AcronymsDataList alloc] initWithArray:jsonArray];
        }
    
        
    }
    
    return self;
}
@end
