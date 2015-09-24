//
//  AcronymsMobileData.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AcronymsError.h"
#import "AcronymsJSONConstants.h"

@interface AcronymsMobileData : NSObject

@property (nonatomic) AcronymsError* error;

-(instancetype) initWithErrorCode:(int) code message:(NSString*) message;

@end
