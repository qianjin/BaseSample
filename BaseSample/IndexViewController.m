//
//  IndexViewController.m
//  BaseSample
//
//  Created by qian jin on 12-11-2.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "IndexViewController.h"
#import "ToolSet.h"
#import "VCTranslucentBarButtonItem.h"
#import "DetailViewController.h"
#import "CycleScrollView.h"
#import "TestViewController.h"
#import "LoginViewController.h"
#import "DataParser.h"

typedef enum{
	requestAd=0,//无
	requestVas
} requestTag;

@implementation IndexViewController


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView
//{
//}


#pragma mark -
#pragma mark init method

-(void) initRes
{   
    //拿广告数据
    dispatch_async(dispatch_get_main_queue(), ^{
       //<a href="advs.php?openid=&type="
        [self requestByGet:@"api/advs.php?openid=6f6fa95e7f439d04947cbbd2be9f9a39&type=1" tipStr:@"数据加载中,请稍后.." tag:requestAd];
    });
    //拿增值业务数据
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSMutableDictionary *params = [[[NSMutableDictionary alloc] init] autorelease];
        [params setValue:@"interact.list" forKey:@"method"];
        [params setValue:@"1.0" forKey:@"v"];
        [params setValue:@"interactApp" forKey:@"appkey"];
        [params setValue:@"" forKey:@"category"];
        [params setValue:@"" forKey:@"key"];
        [params setValue:@"A" forKey:@"cityCode"];
        [params setValue:@"1" forKey:@"start"];
        [params setValue:@"10" forKey:@"limit"];
        [self requestByPost:@"API/api" tipStr:@"数据加载中,请稍后.." params:params tag:requestVas];
    });
    
}

-(void)responseReturnSuccess:(NSString *)json tag:(int)tag
{
    
    BOOL adFlag = NO;
    BOOL vasFlag = NO;
    
    if (tag == requestAd) {
        adList = [DataParser getAdList:json];
        NSArray *adArr = [DataParser getAdList:json];
        for (DataModelAd *ad in adArr) {
            NSLog(@"-----------ad url----------%@",ad.imageUrl);
        }
        adFlag = YES;
    } else {
        
        vasList = [DataParser getVasList:json];
        NSArray *vasArr = [DataParser getVasList:json];
        
        for (DataModelVas *vas in vasArr) {
            NSLog(@"-----------vas name-----------%@",vas.vasName);
        }
        
        vasFlag = YES;
        
    }
    
    if (vasFlag && adFlag) {
        [self drawViews];
    }
    
    
    
}



-(void) drawViews
{   
//    NSMutableArray *picArray = [[NSMutableArray alloc] init];
//    [picArray addObject:[UIImage imageNamed:@"AdImageDefault"]];
//    [picArray addObject:[UIImage imageNamed:@"AdImageDefault"]];
//    CycleScrollView *ads = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)
//                                                   cycleDirection:CycleDirectionLandscape
//                                                         pictures:picArray];
//    ads.delegate = self;
//    [self.view addSubview:ads];
//    [ads release];
//    [picArray release];
    
    
    vasTableView = [[TableView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)];
    
    vasTableView.delegate = self;
    vasTableView.dataSource = self;
    [vasTableView addRefreshView];
    vasTableView.refreshDelegate = self;
    
    
    [self.view addSubview:vasTableView];
    
//    UIButton* testBtn = [ToolSet buttonNormal:@"test" target:self selector:@selector(btnTestClick:) frame:CGRectMake(110, 200, 150, UI_BUTTON_HEIGHT)];
//    
//    [self.view addSubview:testBtn];
//    
//    
//    UIButton *detailBtn = [ToolSet buttonNormal:@"Detail" 
//                                         target:self 
//                                       selector:@selector(btnDetailClick:) 
//                                          frame:CGRectMake(110, 100, 100, UI_BUTTON_HEIGHT)];
//    [self.view addSubview:detailBtn];

    
    
}

#pragma mark -
#pragma mark all button actions

-(void) btnLoginClick:(id) sender
{
    
//    [[self tabBarController] hidesBottomBarWhenPushed];
//    
//    LoginViewController *loginView = [[[LoginViewController alloc] init] autorelease];
//    [loginView.navigationController setNavigationBarHidden:NO];
//    [self pushToTop:loginView];

}


#pragma mark -
#pragma mark tableView 代理

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(void)reloadRefreshDataSource:(int)pageIndex
{
    NSLog(@"page index is :%d",pageIndex);
}


#pragma mark -
#pragma mark scroll的一些代理方法
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [vasTableView scrollViewWillBeginDecelerating:scrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [vasTableView scrollViewDidScroll:scrollView];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView{
    [vasTableView scrollViewDidEndDragging:scrollView];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = nil;
    
    [self initRes];
    [self drawViews];
    

}

-(void) btnTestClick:(id) sender
{
    //[self moveYTarget:label FromValue:50 ToValue:200 Duration:3];
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
    DetailViewController *detail = [[[DetailViewController alloc] init] autorelease];
    [self pushToTop:detail];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"首页";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
