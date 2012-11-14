//
//  BaseController.h
//  BaseSample
//
//  Created by qian jin on 12-11-13.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKNetworkKit.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>

@interface BaseController : UIViewController<MBProgressHUDDelegate>
{
    
}

//异步请求数据
-(void) requestByGet:(NSString *)url 
               tipStr:(NSString *)tipStr 
                  tag:(int) tag;

-(void) requestByPost:(NSString *)url 
               tipStr:(NSString *)tipStr
               params:(NSMutableDictionary *)params 
                  tag:(int) tag;

-(void) responseReturnSuccess:(NSString*)json tag:(int)tag;


@property(retain,nonatomic)MKNetworkEngine* networkEngine;

/**
 *从下向上弹出view
 */
-(void) pushToTop:(UIViewController*)subView;

/**
 *从上向下收起view
 */
-(void) popToParent;

//将view移动Y
-(void) moveYTarget:(UIView*)v FromValue:(int)fromValue ToValue:(int)toValue Duration:(float)duration;


@end
