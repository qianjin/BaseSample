//
//  TableView.m
//  TestTableView
//
//  Created by qian jin on 12-11-8.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "TableView.h"

@implementation TableView

@synthesize refreshDelegate = _refreshDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) addRefreshView{

	currentPage = -1;
	// Initialization code.
	if (_refreshHeaderView == nil) {
		_refreshHeaderView =  [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.frame.size.height, self.frame.size.width, self.frame.size.height)];
		_refreshHeaderView.delegate = self;
		[self addSubview:_refreshHeaderView];
	}
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
    
}


#pragma mark -
#pragma mark 下拉刷新时加载数据
-(void)reloadTableViewDataSource
{   
    currentPage = 1;
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	//刷新数据去吧
	if (refreshDelegate!=nil) {
		[refreshDelegate reloadRefreshDataSource:currentPage];
	}
	
	isLoading = YES;
    
    sleep(3);

    [self doneLoadingTableViewData];
    
    //进行下接刷新时数据加载
    //isLoading = YES;
    //[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}
/**
 *下拉刷新时数据加载完成
 */
-(void)doneLoadingTableViewData
{   
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
    isLoading = NO;
}


#pragma mark -
#pragma mark HeaderView的一些代理方法

/**
 *header
 */
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self reloadTableViewDataSource];
}
-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return isLoading;
}
-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}
//end of header


#pragma mark -
#pragma mark scroll的一些代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
    NSLog(@"is scrolling ");
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}


#pragma mark -
#pragma mark Memory Management
- (void)viewDidUnload {
    _refreshHeaderView= nil;
}

- (void)dealloc {
    _refreshHeaderView= nil;
    [super dealloc];
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
