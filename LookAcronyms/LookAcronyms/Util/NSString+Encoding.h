//
//  NSString+Encoding.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>

// Added category to do URL encoding
@interface NSString (Encoding)
-(NSString*)urlEncodedString;
@end
