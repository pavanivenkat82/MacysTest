//
//  AcronymsData.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsMobileData.h"

@interface AcronymsData : AcronymsMobileData

@property (nonatomic,readonly) NSString* abrevaition;
@property (nonatomic,readonly)  NSUInteger frequecy;
@property (nonatomic,readonly) NSUInteger year;

-(instancetype) initWithDictionary:(NSDictionary*) jsonDictionary;
@end
