//
//  AcronymsResponseData.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AcronymsMobileData.h"
#import "AcronymsRequestData.h"
#import "AcronymsDataList.h"

@interface AcronymsResponseData : NSObject

@property (nonatomic) AcronymsServiceType serviceType;
@property (nonatomic) AcronymsMobileData* mobileData;
@property (nonatomic) int responseCode;

-(instancetype) initWithArray:(NSArray*) jsonDictionary serviceType:(AcronymsServiceType) serviceType;

@end
