//
//  TableView.h
//  TestTableView
//
//  Created by qian jin on 12-11-8.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@protocol UITableViewRefresh
-(void) reloadRefreshDataSource:(int) pageIndex;
@end


@interface TableView : UITableView<EGORefreshTableHeaderDelegate>
{
    BOOL isLoading;

    EGORefreshTableHeaderView *_refreshHeaderView;
    
    id<UITableViewRefresh> refreshDelegate;
    
    int currentPage ;
    
    CGPoint point;//判断是上拉还是下拉
    
}


@property(assign) id<UITableViewRefresh> refreshDelegate;

//刷新时
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;


-(void) addRefreshView;


@end
