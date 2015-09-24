//
//  AcronymsDataList.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsDataList.h"

@implementation AcronymsDataList

-(instancetype) initWithArray:(NSArray*) arrResults
{
    self = [super init];
    
    if(self)
    {
        if (arrResults && arrResults.count > 0)
        {
            NSDictionary* dictResults = [arrResults firstObject];
            NSArray* arrTempResults = dictResults[kJSONResults];
        
         //        //Check the results count and create Results only of there is atleast one result
                if(arrTempResults && arrTempResults.count > 0)
                {
                     NSMutableArray* arrAcronymResults = [[NSMutableArray alloc] initWithCapacity:arrTempResults.count];
                    for (NSDictionary* dictAcronym in arrTempResults)
                    {
                        [arrAcronymResults addObject:[[AcronymsData alloc] initWithDictionary:dictAcronym]];
                    }
                    //Sorting based upon year
        
                    NSSortDescriptor *sorter = [[NSSortDescriptor alloc] initWithKey:@"year" ascending:YES];
                    NSArray *sortDescriptors = [NSArray arrayWithObject: sorter];
        
                    [arrAcronymResults sortUsingDescriptors:sortDescriptors];
                    _arrResults = arrAcronymResults;
                }
        }
    }
    return self;
}
@end
