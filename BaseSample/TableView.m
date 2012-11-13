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
		//NSLog(@"%@", NSStringFromCGRect( _refreshHeaderView.frame ));
		_refreshHeaderView.delegate = self;
		[self addSubview:_refreshHeaderView];
	}
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
	
	//显示刷新条 并且即将要执行刷新的动作
	//[_refreshHeaderView egoRefreshScrollViewDidEndDragging:self];
}


#pragma mark -
#pragma mark 下拉刷新时加载数据
-(void)reloadTableViewDataSource
{   
    currentPage = 0;
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	//刷新数据去吧
	if (refreshDelegate!=nil) {
		[refreshDelegate reloadRefreshDataSource:currentPage];
	}
	
	isLoading = YES;

    //进行下接刷新时数据加载
    //isLoading = YES;
    //[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}
/**
 *下接刷新时数据加载完成
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
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
	point =scrollView.contentOffset;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
	CGPoint pt =scrollView.contentOffset;
	if (point.y < pt.y) {//向上提加载更多
		//if (_refreshFooterView.hidden) {
		//	return;
		//}
		//[_refreshFooterView egoRefreshScrollViewDidScroll:self];
	}
	else {
		[_refreshHeaderView egoRefreshScrollViewDidScroll:self];
	}
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView{
	CGPoint pt =scrollView.contentOffset;
	if (point.y < pt.y) {//向上提加载更多
		//if (_refreshFooterView.hidden) {
		//	return;
		//}
		//[_refreshFooterView egoRefreshScrollViewDidEndDragging:self];
	}
	else {//向下拉加载更多
		[_refreshHeaderView egoRefreshScrollViewDidEndDragging:self];
	}
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
