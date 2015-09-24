//
//  AcronymsNetworkManager.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AcronymsRequestData.h"
#import "AcronymsResponseData.h"

// AcronymsNetworkManager is used to make network call Asyncronously using AFNetworking .

#import "AcronymsAppUtil.h"

@protocol AcronymsNetworkManagerDelegate <NSObject>

-(void) sendResponseData:(AcronymsResponseData*) responseData;

@end
@interface AcronymsNetworkManager : NSObject

@property (nonatomic,weak) id<AcronymsNetworkManagerDelegate> networkResponseDelegate;

-(void) sendAsynchronousRequest:(AcronymsRequestData*) requestData;
@end
