//
//  LookAcronymsTests.m
//  LookAcronymsTests
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AcronymsNetworkManager.h"
#import "AcronymsTableViewCell.h"

@interface LookAcronymsTests : XCTestCase<AcronymsNetworkManagerDelegate>
@property (nonatomic) XCTestExpectation * testExpectation;
@end

@implementation LookAcronymsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

-(void) testNetworkCall
{
    self.testExpectation  = [self expectationWithDescription:@"NETWORK"];
    [self makeSearchNetworkCall:@"BBC"];
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        
    }];
}
-(void) makeSearchNetworkCall :(NSString*) searchTerm
{
    //Showing ActivityIndicator status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
   
    //Cretaing inputparameters
    NSMutableDictionary* inputParams = [NSMutableDictionary dictionary];
    [inputParams setValue:searchTerm	forKey:kJSONSearchTerm];
    //Creating request data
    AcronymsRequestData* reqData = [[AcronymsRequestData alloc] initWithURL:kNetworkURLGetAcronyms networkRequestType:AcronymsNetworkRequestTypeGET serviceType:AcronymsServiceTypeGetAcronyms inputPrameters:inputParams] ;
    
    AcronymsNetworkManager* manager = [[AcronymsNetworkManager alloc] init];
    manager.networkResponseDelegate = self;
    [manager sendAsynchronousRequest:reqData];
}


-(void) sendResponseData:(AcronymsResponseData*) responseData
{
    //Hiding ActivityIndicator status bar
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
   
    if(responseData.serviceType == AcronymsServiceTypeGetAcronyms)
    {
        AcronymsMobileData* data = responseData.mobileData;
        if(data.error)
        {
            
            
        }
        else
        {
            [self.testExpectation fulfill];
        }
    }
}
- (void)testPerformanceExample
{
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
