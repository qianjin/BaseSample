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
#import "CycleScrollView.h"
#import "TestViewController.h"
#import <QuartzCore/QuartzCore.h>

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
    
    
    NSMutableArray *picArray = [[NSMutableArray alloc] init];
    [picArray addObject:[UIImage imageNamed:@"AdImageDefault"]];
    [picArray addObject:[UIImage imageNamed:@"AdImageDefault"]];

    CycleScrollView *ads = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)
                                                     cycleDirection:CycleDirectionLandscape
                                                           pictures:picArray];
    ads.delegate = self;
    [self.view addSubview:ads];
    [ads release];
    [picArray release];

    
    
    UIButton* testBtn = [ToolSet buttonNormal:@"test" target:self selector:@selector(btnTestClick:) frame:CGRectMake(110, 200, 150, UI_BUTTON_HEIGHT)];
    
    [self.view addSubview:testBtn];
    
    
    
    UIButton *detailBtn = [ToolSet buttonNormal:@"Detail" 
                                         target:self 
                                       selector:@selector(btnDetailClick:) 
                                          frame:CGRectMake(110, 100, 100, UI_BUTTON_HEIGHT)];
    [self.view addSubview:detailBtn];
//    
//
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(110, 150, 100, UI_LABEL_HEIGHT)];
//    lable.text = @"Hello world";
//    [self.view addSubview:lable];
//    [lable release];
    
    
}

-(void) btnTestClick:(id) sender
{
    TestViewController* test = [[[TestViewController alloc] init] autorelease];
    [[self navigationController] pushViewController:test animated:YES];
}


#pragma mark - CycleScrollViewDelegate
- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didSelectImageView:(int)index {
    [ToolSet messagebox:[NSString stringWithFormat:@"第%d张",index]];
}

- (void)cycleScrollViewDelegate:(CycleScrollView *)cycleScrollView didScrollImageView:(int)index {
    //ad移动的时候做的操作
    //self.title = [NSString stringWithFormat:@"第%d张", index];
}




-(void) btnDetailClick:(id) sender
{
    
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
//    barButtonItem.title = @"返回";
//    self.navigationItem.backBarButtonItem = barButtonItem;
//    [barButtonItem release];
    
    DetailViewController *detail = [[[DetailViewController alloc] init] autorelease];
    
    CATransition *transition = [CATransition animation];
	transition.duration = 0.5;
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]; 
	transition.type = kCATransitionMoveIn; 
	transition.subtype = kCATransitionFromTop;
	transition.delegate = self; 
	[self.navigationController.view.layer addAnimation:transition forKey:nil];
	//self.navigationController.navigationBarHidden = NO; 
	[self.navigationController pushViewController:detail animated:NO];
    
    
    //[[self navigationController] pushViewController:detail animated:YES];
    
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
