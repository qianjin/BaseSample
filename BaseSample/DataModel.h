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


#pragma mark - 广告bean
@interface DataModelAd : NSObject {
    NSString *imageUrl;
    NSString *url;
    int count;
}

@property (nonatomic,retain) NSString *imageUrl;
@property (nonatomic,retain) NSString *url;
@property (assign) int count;

@end

#pragma mark - vas bean
@interface DataModelVas : NSObject {
    NSString *imageUrl;
    NSString *vasName;
    NSString *typeName;
    NSString *typeId;
    NSString *price;
    int count;
}

@property (nonatomic,retain) NSString *imageUrl;
@property (nonatomic,retain) NSString *vasName;
@property (nonatomic,retain) NSString *typeName;
@property (nonatomic,retain) NSString *typeId;
@property (nonatomic,retain) NSString *price;
@property (assign) int count;


@end