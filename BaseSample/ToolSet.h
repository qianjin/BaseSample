//
//  ToolSet.h
//  BaseDemo
//
//  Created by qian jin on 12-9-28.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

typedef enum 
{
    btnTypeLogin = 0,
    btnTypeOfHome,
    btnTypeRemmberPwd
    
}btnTypeOfToolSet;

@interface ToolSet : NSObject


+ (UIButton *)buttonWithTitle:	(NSString *)title
					   target:(id)target
					 selector:(SEL)selector
						frame:(CGRect)frame
				darkTextColor:(BOOL)darkTextColor
                   buttonType:(btnTypeOfToolSet)btype;

#pragma mark -常用button
+(UIButton *)buttonNormal:(NSString *) title
                   target:(id)taget
                 selector:(SEL) selector
                    frame:(CGRect)frame;

#pragma mark - 
#pragma mark 显示一条提示message 
+(void) showMessage:(NSString *) message
               view:(UIView *) view;

#pragma mark -
#pragma mark 显示一个进度条
+(MBProgressHUD *) setHUD:(NSString *)message
         target:(id)target
           view:(UIView *) view;


@end
