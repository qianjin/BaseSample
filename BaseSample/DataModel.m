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


