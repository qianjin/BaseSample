//
//  ToolSet.m
//  BaseDemo
//
//  Created by qian jin on 12-9-28.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "ToolSet.h"
#import "MBProgressHUD.h"

@implementation ToolSet

#pragma mark -常用button
+(UIButton *) buttonNormal:(NSString *)title 
                    target:(id)target 
                  selector:(SEL)selector 
                     frame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    
    button.frame = frame;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];	
    
    UIImage *imageBtnNor = [UIImage imageNamed:@"btn_unclicked.png"];
    UIImage *imageBtnPress = [UIImage imageNamed:@"btn_clicked.png"];
    [button setBackgroundImage:imageBtnNor forState:UIControlStateNormal];
    [button setBackgroundImage:imageBtnPress forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize: 16];
    
    return button;
}

+(UIButton *) buttonWithTitle:(NSString *)title target:(id)target selector:(SEL)selector frame:(CGRect)frame darkTextColor:(BOOL)darkTextColor buttonType:(btnTypeOfToolSet)btype
{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    
    return button;
    
}

/**
 *显示一个文字提示
 */
+(void)showMessage:(NSString *)message view:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];  
    hud.mode = MBProgressHUDModeText;  
    hud.labelText = message;  
    hud.margin = 10.f;  
    hud.yOffset = 150.f; 
    //hud.color = [UIColor clearColor];
    hud.removeFromSuperViewOnHide = YES;  
    [hud hide:YES afterDelay:1]; 
}

/**
 *
 */
+(MBProgressHUD *)setHUD:(NSString *)message
        target:(id)target
          view:(UIView *)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    //hud.delegate = target;
    hud.labelText = message;
	[view addSubview:hud];
	//HUD.dimBackground = YES;
    return hud;
}



@end
