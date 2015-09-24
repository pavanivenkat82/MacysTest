//
//  AcronymsDataList.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsMobileData.h"
#import "AcronymsData.h"

@interface AcronymsDataList : AcronymsMobileData
@property (nonatomic,readonly) NSArray* arrResults;

-(instancetype) initWithArray:(NSArray*) arrResults;
@end
