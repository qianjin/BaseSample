//
//  DataModel.h
//  BaseDemo
//
//  Created by qian jin on 12-9-28.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@end

#pragma mark - 用户bean
@interface DataModelUser : NSObject {
    NSString *userName;
    NSString *password;
    NSString *sessionKey;
}

@property (nonatomic,retain) NSString *userName;
@property (nonatomic,retain) NSString *password;
@property (nonatomic,retain) NSString *sessionKey;


@end