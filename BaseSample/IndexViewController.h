//
//  IndexViewController.h
//  BaseSample
//
//  Created by qian jin on 12-11-2.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"
#import "TableView.h"

@interface IndexViewController : BaseController<UITableViewDataSource,UITableViewDelegate,UITableViewRefresh>
{
    NSArray *vasList;
    NSArray *adList;
    
    TableView *vasTableView;
}

@end
