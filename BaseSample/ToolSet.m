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

/**
 *显示一个提示框
 */ 
+ (void)messagebox:(NSString*)string{
	UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"" 
												  message:string 
												 delegate:self 
										cancelButtonTitle:@"好" 
										otherButtonTitles:nil ,
						nil];
	[ale show];
	[ale release];
}

+(NSString*)getCurrentDate:(NSDate*)date{
	//得到毫秒
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	//[dateFormatter setDateFormat:@"hh:mm:ss"]
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
	//NSLog(@"Date%@", [dateFormatter stringFromDate:[NSDate date]]);
	NSString *currentdt = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	return currentdt;
}

//取消键盘
+(void) cancelKeyBoard:(UIView*)view{
	NSArray *childs = view.subviews;
	
	for (int i = 0; i< [childs count]; i++) {
		UIView *tb = [childs objectAtIndex:i];	
		
		if ([tb isKindOfClass:[UITextField class]]) {
			[tb resignFirstResponder];
		}
		else {
			[self cancelKeyBoard:tb];
		}
	}
}

/**
 *删除掉view下面的子view
 */
+(void) removeChilds:(UIView*)view{
	NSArray *arr = [view subviews];
	for (int i = 0; i<[arr count]; i++) {
		UIView *uv = [arr objectAtIndex:i];
		if (uv!=nil) {
			[uv removeFromSuperview];
		}
	}
}

/**
 *得到文件大小
 */
+(NSString*) getFileSize:(NSString*)folderPath{
	float fileSize = 0;
	NSArray *contents; 
    NSEnumerator *enumerator; 
    NSString *path; 
    contents = [[NSFileManager defaultManager] subpathsAtPath:folderPath]; 
    enumerator = [contents objectEnumerator]; 
    
    while (path = [enumerator nextObject]) { 
		NSError *err = nil;
		NSDictionary *fattrib = [[NSFileManager defaultManager] attributesOfItemAtPath:[folderPath stringByAppendingPathComponent:path] error:&err];
		fileSize +=[fattrib fileSize]; 
    } 
	fileSize = fileSize/1024;
	fileSize = fileSize/1024;
	return [@"" stringByAppendingFormat:@"%.2fM",fileSize];
}

/**
 *删除文件
 */
+(NSString*) deleteFiles:(NSString*)folderPath{
	if([[NSFileManager defaultManager] fileExistsAtPath:folderPath])
	{
		[[NSFileManager defaultManager] removeItemAtPath:folderPath error:nil];
		return @"清理成功";
	}
	return @"已清理";
}


@end
