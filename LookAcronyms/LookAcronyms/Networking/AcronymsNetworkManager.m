//
//  AcronymsNetworkManager.m
//  LookAcronyms
//
//  Created by Pavani Repalle. on 09/23/15.
//  Copyright (c) 2015 Pavani. All rights reserved.
//

#import "AcronymsNetworkManager.h"
#import "JSONConversionUtil.h"
#import "AFNetworking.h"
#import "NSString+Encoding.h"

@implementation AcronymsNetworkManager

-(NSString*) getRequestURLString:(AcronymsRequestData*) requestData
{
    if(!requestData.inputParams || [requestData.inputParams count] == 0)
    {
        return requestData.url;
        
    }
    
    NSMutableString* paramString = [NSMutableString stringWithString:@""];
    
    [requestData.inputParams enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop)
     {
         
         if(key.description.length == 0)
             return ;
         if(obj.description.length == 0)
         {
             obj = @"";
         }
         
         if(paramString.length)
             [paramString appendFormat:@"&%@=%@",[key urlEncodedString],[obj urlEncodedString]];
         else
             [paramString appendFormat:@"%@=%@",[key urlEncodedString],[obj urlEncodedString]];
     }];
    return [NSString stringWithFormat:@"%@?%@",requestData.url,paramString];
}

-(void) sendAsynchronousRequest:(AcronymsRequestData*) requestData
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.HTTPAdditionalHeaders = @{@"Content-Type": @"text/plain"};
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString* fullURLString = [self getRequestURLString:requestData];
    NSURL *URL = [NSURL URLWithString:fullURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    manager.responseSerializer =    [AFCompoundResponseSerializer serializer];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, NSData* responseObject, NSError *error)
    {
        AcronymsResponseData* responseData = nil;
        if (error)
        {
            DLog(@"Error: %@", error);
            responseData = [[AcronymsResponseData alloc] init];
            responseData.mobileData = [[AcronymsMobileData alloc] init];
            responseData.mobileData.error = [[AcronymsError alloc] initWithErrorCode:error.code message:error.localizedDescription];
        }
        else
        {
            DLog(@" %@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]  );
            NSArray* arrResults = [JSONConversionUtil convertJSONDataToDictionary:responseObject];
            responseData = [[AcronymsResponseData alloc] initWithArray:arrResults serviceType:requestData.serviceType];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            //TODO check
            DLog(@"making network call");
            [self.networkResponseDelegate sendResponseData:responseData];
        });
    }];
    [dataTask resume];

}
@end
