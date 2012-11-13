//
//  IndexViewController.m
//  BaseSample
//
//  Created by qian jin on 12-11-2.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "IndexViewController.h"
#import "ToolSet.h"
#import "VCCustomNavigationBar.h"
#import "DetailViewController.h"

@implementation IndexViewController

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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.画页面背景
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH,UI_SCREEN_HEIGHT)];
    img.image = [UIImage imageNamed:@"bg_sand"];
    [self.view addSubview:img];
    [img release];
    
    //UIButton *button = [UIButton alloc] initWithFrame:CGRectMake(110, 100, 100, UI_BUTTON_HEIGHT);
    UIButton *detailBtn = [ToolSet buttonNormal:@"Detail" 
                                         target:self 
                                       selector:@selector(btnDetailClick:) 
                                          frame:CGRectMake(110, 100, 100, UI_BUTTON_HEIGHT)];
    [self.view addSubview:detailBtn];
    

    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(110, 150, 100, UI_LABEL_HEIGHT)];
    lable.text = @"Hello world";
    [self.view addSubview:lable];
    [lable release];
    
    
}


-(void) btnDetailClick:(id) sender
{
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = barButtonItem;
    [barButtonItem release];
    
    DetailViewController *detail = [[[DetailViewController alloc] init] autorelease];
    [[self navigationController] pushViewController:detail animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"首页";
    //[ToolSet removeLogoImageFromSuperView:self.navigationController.navigationBar andTag:tagForTopbarImageView];
    //[ToolSet removeLogoImageFromSuperView:self.navigationController.navigationBar andTag:10015];
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
