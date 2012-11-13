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

@interface BaseController : UIViewController<MBProgressHUDDelegate>
{
    MKNetworkEngine* networkEngine;
    MBProgressHUD* HUD;
}

//异步请求数据
-(void) requestByGet:(NSString*)url;
-(MKNetworkOperation *) requestByPost :(NSString*)url params:(NSMutableDictionary*)params;
-(void) responseReturnSuccess:(NSString*)json url:(NSString *)url;


-(void) ShowParent:(id)sender;
-(void) StartAnimation:(int)type;
-(void) PushToTop:(UIViewController*)subView;
-(void) PopToParent;
-(void) BackToMain;
-(void) RightToMain;
-(void) LeftToMain;
-(void) RightLoginOut;
-(void) RightToMap;
-(void) RightToMapList;
-(void) RightToMapPath;
-(void) LeftChooseCity;
-(void) RightRefresh;


@end
