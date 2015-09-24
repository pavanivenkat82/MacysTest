//
//  AcronymsJSONConstants.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymsJSONConstants : NSObject
//Request
#define  kJSONSearchTerm        @"sf"

//response
#define  kJSONResults           @"lfs"
#define  kJSONAbbrevation       @"lf"
#define  kJSONFrequency         @"freq"
#define  kJSONYear              @"since"


#define kNetworkURLGetAcronyms  @"http://www.nactem.ac.uk/software/acromine/dictionary.py"

@end
