//
//  DataModel.m
//  BaseDemo
//
//  Created by qian jin on 12-9-28.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

@end

//实现DataModelUser
@implementation DataModelUser

@synthesize userName,password,sessionKey;

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc {
    if(userName)
    {
        [userName release];
        userName = nil;
    }
    if(password){
        [password release];
        password = nil;
    }
    if(sessionKey){
        [sessionKey release];
        sessionKey = nil;
    }
    [super dealloc];
}

@end

@implementation DataModelAd

@synthesize imageUrl,url,count;

- (id)init {
self = [super init];
if (self) {
}
return self;
}

- (void)dealloc {
    if(imageUrl)
    {
        [imageUrl release];
        imageUrl = nil;
    }
    if(url){
        [url release];
        url = nil;
    }
    [super dealloc];
}

@end


//NSString *imageUrl;
//NSString *vasName;
//NSString *typeName;
//NSString *typeId;
//NSString *price;
//int count;

/**
 *vas Bean
 */
@implementation DataModelVas
@synthesize imageUrl,vasName,count,price,typeId,typeName;

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc {
    if(imageUrl)
    {
        [imageUrl release];
        imageUrl = nil;
    }
    if(vasName){
        [vasName release];
        vasName = nil;
    }
    if(price){
        [price release];
        price = nil;
    }
    if(typeId){
        [typeId release];
        typeId = nil;
    }
    if(typeName){
        [typeName release];
        typeName = nil;
    }
    [super dealloc];
}

@end





