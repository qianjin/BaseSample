//
//  DetailViewController.m
//  BaseSample
//
//  Created by qian jin on 12-11-2.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "DetailViewController.h"
#import "ToolSet.h"
#import "VCTranslucentBarButtonItem.h"
#import <QuartzCore/QuartzCore.h>

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

-(void) btnBackClick:(id) sender
{
    [self popToParent];    
    //[self.navigationController popViewControllerAnimated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
 self.navigationItem.hidesBackButton = YES;
    
    
// [ToolSet removeLogoImageFromSuperView:self.navigationController.navigationBar andTag:10015]; 
// [ToolSet AddNavigationBarBackButtonwithTag:100 Title:@" 返回" target:self selector:@selector(btnBackClick:) targetView:self.navigationController.navigationBar isNeedDelegateButton:NO];
    
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btnClickMe = [ToolSet buttonNormal:@"Click Me" target:self selector:@selector(btnClickMeClick:) frame:CGRectMake(110, 200, 100, UI_BUTTON_HEIGHT)];
    
    [self.view addSubview:btnClickMe];
    
    
}

-(void) btnClickMeClick:(id) sender
{
    //[ToolSet messagebox:@"Test111"];
    
    NSMutableDictionary *dic = [[[NSMutableDictionary alloc] init] autorelease];
    [dic setValue:@"user.login" forKey:@"method"];
    [dic setValue:@"1.0" forKey:@"v"];
    [dic setValue:@"iphone" forKey:@"appkey"];
    [dic setValue:@"308c982d146cbb85297621658d6b5ecc17b184cd" forKey:@"sig"];
    [dic setValue:@"571000033XS" forKey:@"username"];
    [dic setValue:@"123456" forKey:@"password"];
    [self requestByPost:@"API/api" tipStr:@"Login信息加载中.." params:dic tag:0];
    
    
}


-(void)responseReturnSuccess:(NSString *)json tag:(int)tag
{
    [ToolSet messagebox:json];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
