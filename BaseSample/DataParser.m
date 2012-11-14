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


+(NSArray *)getAdList:(NSString *)strData
{   
    
    NSMutableArray *arr;
    
    NSData* jsonData = [strData dataUsingEncoding:NSUTF8StringEncoding];  
    NSDictionary *dataDict = [jsonData objectFromJSONData];
    
    NSString *code = [NSString stringWithFormat:@"%@",[dataDict valueForKey:@"code"]];
    if([code isEqualToString:@"0"]){
       
        //{"code":"0","item":{"count":"1","list":[{"pic":"http:\/\/app.zj165.com\/uploads\/allimg\/120919\/advs-480-800.png","url":"http:\/\/app.zj165.com"}]}}
        arr = [[NSMutableArray alloc] init];
        
        NSDictionary *itemDict = [dataDict valueForKey:@"item"];
        
        NSArray *list = [itemDict valueForKey:@"list"];
        int total = (int)[itemDict valueForKey:@"count"];
        
        for (int i =0; i<[list count]; i++) {
            NSDictionary *beanDict = [list objectAtIndex:i];
            DataModelAd *ad = [[DataModelAd alloc] init];
            ad.count = total;
            ad.url = [beanDict valueForKey:@"url"];
            ad.imageUrl = [beanDict valueForKey:@"pic"];
            [arr addObject:ad];
        }
    
    }
    
    return arr;

}

/**
 *得到增值业务列表
 */
+(NSArray *)getVasList:(NSString *)strData
{
    NSMutableArray *arr;
    
    NSData* jsonData = [strData dataUsingEncoding:NSUTF8StringEncoding];  
    NSDictionary *dataDict = [jsonData objectFromJSONData];
    
    NSString *code = [NSString stringWithFormat:@"%@",[dataDict valueForKey:@"code"]];
    if([code isEqualToString:@"0"]){
       
        arr = [[NSMutableArray alloc] init];
        
        int total = (int)[dataDict valueForKey:@"total"];
        NSDictionary *itemDict = [dataDict valueForKey:@"item"];
        
        NSArray *list = [itemDict valueForKey:@"list"];
        
        for (int i =0; i<[list count]; i++) {
            NSDictionary *beanDict = [list objectAtIndex:i];
            DataModelVas *vas = [[DataModelVas alloc] init];
            vas.count = total;
            vas.vasName = [beanDict valueForKey:@"productName"];  
            vas.typeName = [beanDict valueForKey:@"categoryName"]; 
            vas.typeId = [beanDict valueForKey:@"categoryId"]; 
            vas.price = [beanDict valueForKey:@"price"]; 
            vas.imageUrl = [beanDict valueForKey:@"imgUrl"]; 
            
            [arr addObject:vas];
        }
        
    }
    
    return arr;
}



@end
