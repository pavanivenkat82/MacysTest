//
//  AcronymsRequestData.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsRequestData.h"

@implementation AcronymsRequestData

-(instancetype) initWithURL:(NSString*) reqUrl networkRequestType:(AcronymsNetworkRequestType) nReqType serviceType:(AcronymsServiceType) reqServiceType inputPrameters:(NSDictionary*) inputParameter
{
    self = [super init];
    
    if(self)
    {
        _url = reqUrl;
        _networkRequestType = nReqType;
        _serviceType = reqServiceType;
        _inputParams  = inputParameter;
        _timeOutForRequest = 30;
        _timeOutForResource = 300;    }
    
    return self;
    
}
@end
