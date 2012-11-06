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
    [self.navigationController popViewControllerAnimated:YES];
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
    
    //1.画页面背景
    UIImageView *loginBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH,UI_SCREEN_HEIGHT)];
    loginBgImageView.image = [UIImage imageNamed:@"bg_sand"];
    [self.view addSubview:loginBgImageView];
    [loginBgImageView release];
    
    //[[[self navigationItem] backBarButtonItem] setTitle:@""];
    //[[[[self navigationController] navigationItem] backBarButtonItem] setTitle:@""];
    
    //self.navigationItem.backBarButtonItem.image = nil;
    //self.navigationItem.backBarButtonItem.title = @"test";
    
    VCTranslucentBarButtonItem *item = [[VCTranslucentBarButtonItem alloc] initWithType:VCTranslucentBarButtonItemTypeBackward title:@"Test Button" target:self action:@selector(btnBackClick)];
    self.navigationItem.leftBarButtonItem = item;
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
