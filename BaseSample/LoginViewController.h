//
//  LoginViewController.h
//  BaseSample
//
//  Created by qian jin on 12-11-1.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface LoginViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,MBProgressHUDDelegate>
{
    UITableView *loginTableView;
    UITextField *tfUserName;
    UITextField *tfPassword;
    
    Boolean isEdit;
    
    
}
@end
