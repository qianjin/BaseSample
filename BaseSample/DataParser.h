//
//  DataParser.h
//  BaseDemo
//
//  Created by qian jin on 12-9-29.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@interface DataParser : NSObject


+(DataModelUser *) getUserInfo:(NSString *) strData;

+(NSArray *) getAdList:(NSString *) strData;

+(NSArray *) getVasList:(NSString *) strData;


@end


