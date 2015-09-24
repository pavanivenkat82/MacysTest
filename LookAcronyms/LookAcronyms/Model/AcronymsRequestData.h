//
//  AcronymsRequestData.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymsRequestData : NSObject

//Created Enum for MusicNetworkRequestType
typedef NS_ENUM(NSInteger, AcronymsNetworkRequestType) {
    AcronymsNetworkRequestTypeGET,
    AcronymsNetworkRequestTypePOST
};

typedef NS_ENUM(NSInteger, AcronymsServiceType)
{
    AcronymsServiceTypeGetAcronyms
    
};

@property (nonatomic) NSString* url;
@property (nonatomic) AcronymsNetworkRequestType networkRequestType;
@property (nonatomic) AcronymsServiceType serviceType;
@property (nonatomic) NSDictionary* inputParams;
@property (nonatomic) int timeOutForRequest;
@property (nonatomic) int timeOutForResource;

-(instancetype) initWithURL:(NSString*) reqUrl networkRequestType:(AcronymsNetworkRequestType) nReqType serviceType:(AcronymsServiceType) reqServiceType inputPrameters:(NSDictionary*) inputParameter;
@end
