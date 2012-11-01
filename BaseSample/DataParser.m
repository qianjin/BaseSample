//
//  DataParser.m
//  BaseDemo
//
//  Created by qian jin on 12-9-29.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "DataParser.h"
#import "JSONKit.h"
#import "DataModel.h"

@implementation DataParser

#pragma mark - 解析login
+(DataModelUser *) getUserInfo:(NSString *)strData
{
    NSData* jsonData = [strData dataUsingEncoding:NSUTF8StringEncoding];  
    NSDictionary *dataDict = [jsonData objectFromJSONData];
    NSString *code = [NSString stringWithFormat:@"%@",[dataDict valueForKey:@"code"]];
    if([code isEqualToString:@"0"]){
        NSDictionary *sessionKeyDict = [dataDict valueForKey:@"item"];
        NSString *sessionKey = [sessionKeyDict valueForKey:@"sessionkey"];
        NSDictionary *userDict = [sessionKeyDict valueForKey:@"user"];
        
        NSString *userName = [userDict valueForKey:@"username"];
        NSString *password = [userDict valueForKey:@"password"];        
        
        DataModelUser *user = [[DataModelUser alloc] init];
        
        user.userName = userName;
        user.password = password;
        user.sessionKey = sessionKey;
        
        return user;
    }
    
    return nil;
}

@end
