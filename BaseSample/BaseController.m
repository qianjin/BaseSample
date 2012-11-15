//
//  BaseController.m
//  BaseSample
//
//  Created by qian jin on 12-11-13.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "BaseController.h"
#import "ToolSet.h"
#import "VCTranslucentBarButtonItem.h"

@implementation BaseController

@synthesize networkEngine = _networkEngine;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //if (_networkEngine==nil) {
         //   _networkEngine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
        //} else {
            
        //}
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)requestByGet:(NSString *)url tipStr:(NSString *)tipStr tag:(int)tag
{
    MBProgressHUD* hud = [[MBProgressHUD alloc] initWithView:self.view];
	//HUD.dimBackground = YES;］
    //HUD.color = [UIColor lightGrayColor];
    [self.view addSubview:hud];
    hud.labelText = tipStr;
    hud.labelFont = [UIFont systemFontOfSize:12];
    //HUD.detailsLabelText = @"Test detail"; 
    hud.delegate = self;
    [hud show:YES];
    
    
    MKNetworkEngine * networkEngine = [[MKNetworkEngine alloc] initWithHostName:@"app.zj165.com" customHeaderFields:nil];
 
    MKNetworkOperation *op = [networkEngine operationWithPath:url params:nil httpMethod:@"GET"];
    [op onCompletion:^(MKNetworkOperation *operation){
        [self responseReturnSuccess:[operation responseString] tag:tag];
        [hud hide:YES];
    } 
    onError:^(NSError *error){
        [hud hide:YES];
        [ToolSet messagebox:@"联网出错！"];
        DLog(@"%@", error);
    }];
    [networkEngine enqueueOperation:op];
    [networkEngine release];
 
}


-(void) requestByPost:(NSString *)url 
               tipStr:(NSString *)tipStr 
               params:(NSMutableDictionary *)params 
                  tag:(int) tag
{   
    
    MBProgressHUD* hud = [[MBProgressHUD alloc] initWithView:self.view];
	//HUD.dimBackground = YES;］
    //HUD.color = [UIColor lightGrayColor];
    [self.view addSubview:hud];
    hud.labelFont = [UIFont systemFontOfSize:12];
    hud.labelText = tipStr;
    //HUD.detailsLabelText = @"Test detail"; 
    hud.delegate = self;
    [hud show:YES];
    
    MKNetworkEngine * networkEngine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
   
    MKNetworkOperation *op = [networkEngine operationWithPath:url params:params httpMethod:@"POST"];
    [op onCompletion:^(MKNetworkOperation *operation){
        [self responseReturnSuccess:[operation responseString] tag:tag];
        [hud hide:YES];
    } 
    onError:^(NSError *error){
        [hud hide:YES];
        [ToolSet messagebox:@"联网出错！"];
        DLog(@"%@", error);
    }];
    [networkEngine enqueueOperation:op];
    [networkEngine release];
}

-(void)responseReturnSuccess:(NSString *)json tag:(int)tag
{
    
}

/**
 *从下向上弹出controller
 */
-(void)pushToTop:(UIViewController *)subView
{
    CATransition *transition = [CATransition animation];
	transition.duration = 0.5;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; 
	transition.type = kCATransitionMoveIn; 
	transition.subtype = kCATransitionFromTop;
	transition.delegate = self; 
	[self.navigationController.view.layer addAnimation:transition forKey:nil];
	//self.navigationController.navigationBarHidden = NO; 
	[self.navigationController pushViewController:subView animated:NO];
}

/**
 *从下向上返回上一级
 */
-(void)popToParent
{
    CATransition *transition = [CATransition animation];
	transition.duration = 0.5;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; 
	transition.type = kCATransitionReveal; 
	transition.subtype = kCATransitionFromBottom;
	transition.delegate = self; 
	[self.navigationController.view.layer addAnimation:transition forKey:nil];
	//self.navigationController.navigationBarHidden = NO; 
	[self.navigationController popViewControllerAnimated:NO];
}

//移动Y
-(void) moveYTarget:(UIView*)v FromValue:(int)fromValue ToValue:(int)toValue Duration:(float)duration{
	
    CABasicAnimation *theAnimation;
	theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	//theAnimation.delegate = self;
	theAnimation.duration = duration;
	theAnimation.repeatCount = 1;
	theAnimation.removedOnCompletion = FALSE;
	//theAnimation.fillMode = kCAFillModeForwards;
	theAnimation.autoreverses = NO;
    //	theAnimation.fromValue = [NSNumber numberWithFloat:fromValue];
    //	theAnimation.toValue = [NSNumber numberWithFloat:toValue];
	theAnimation.toValue=[NSNumber numberWithInt:toValue];
	theAnimation.fromValue=[NSNumber numberWithInt:fromValue];
    
	theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[[v layer] addAnimation:theAnimation forKey:@"animateLayer"]; 
    
}



#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.画出公共背景
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH,UI_SCREEN_HEIGHT)];
    bg.image = [UIImage imageNamed:@"bg_sand"];
    [self.view addSubview:bg];
    [bg release];
    
    //2.titleBar的返回
    VCTranslucentBarButtonItem *item = [[VCTranslucentBarButtonItem alloc] initWithType:VCTranslucentBarButtonItemTypeBackward title:@"返 回" target:self action:@selector(btnBackClick:)];
    self.navigationItem.leftBarButtonItem = item;

    //2.做一些公共的初始化的东西
    
}

#pragma mark -
#pragma mark button action

-(void) btnBackClick:(id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}


- (void)dealloc {
   
    [super dealloc];
}

-(void)hudWasHidden:(MBProgressHUD *)hud
{   
    if(hud){
        [hud removeFromSuperview];
        [hud release];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
