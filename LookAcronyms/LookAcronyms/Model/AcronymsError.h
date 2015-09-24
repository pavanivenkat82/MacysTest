//
//  AcronymsError.h
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymsError : NSObject

@property (nonatomic) NSInteger code;
@property (nonatomic) NSString* message;

-(instancetype) initWithErrorCode:(NSInteger) errorCode message:(NSString*) message;

@end
