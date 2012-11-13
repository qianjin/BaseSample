//
//  LoginViewController.m
//  BaseSample
//
//  Created by qian jin on 12-11-1.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "LoginViewController.h"
#import "ToolSet.h"
#import "MKNetworkKit.h"
#import "DataModel.h"
#import "DataParser.h"
#import "AppDelegate.h"
#import "IndexViewController.h"
#import "MoreViewController.h"
#import "OtherViewController.h"

extern AppDelegate *appDelegate;

@implementation LoginViewController

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
    
    appDelegate.isRemberPas = NO;
    
    //初始化一些变量
    isEdit = NO;
    
    
    //1.画页面背景
    UIImageView *loginBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    loginBgImageView.image = [UIImage imageNamed:@"tab_bg"];
    [self.view addSubview:loginBgImageView];
    [loginBgImageView release];
    
    //2.画tableView
    if(loginTableView == nil)
    {
        loginTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, 320, 230) style:UITableViewStyleGrouped];
        loginTableView.delegate = self;
        loginTableView.dataSource = self;
        loginTableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:loginTableView];
    } 
    else 
    {
        [loginTableView reloadData];
    }    
    
    //3.画记住密码btn
    UIButton *btnRemmberPas = [[UIButton alloc] initWithFrame:CGRectMake (15, 115, 25, 25)];
    [btnRemmberPas setBackgroundImage:[UIImage imageNamed:@"checkbox_nor"] forState:UIControlStateNormal];
    
    [btnRemmberPas addTarget:self action:@selector(btnRemmberPasClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [loginTableView addSubview:btnRemmberPas];
    [btnRemmberPas release];
    
    UILabel *lableRemmber = [[UILabel alloc] initWithFrame:CGRectMake(40, 120.0, UI_LABEL_LENGTH, UI_LABEL_HEIGHT)];
    
    [lableRemmber setText:@"记住密码"];
    [lableRemmber setBackgroundColor:[UIColor clearColor]];
    [lableRemmber setFont:[UIFont systemFontOfSize:14.0]];
    [loginTableView addSubview:lableRemmber];
    [lableRemmber release];
    
    
    //4.LoginButton
    UIButton *btnLogin = [ToolSet buttonNormal:@"登录" 
                                        target:self 
                                      selector:@selector(btnLoginClick:) 
                                         frame:CGRectMake(160, 110, 150, UI_BUTTON_HEIGHT)];
    [loginTableView addSubview:btnLogin];
    
}

#pragma mark - 
#pragma mark Login成功后的操作 
-(void) loginSuccess:(DataModelUser *)user
{
    
    /*
    if (appDelegate.isRemberPas == YES) {
        //自己的文件名（包括目录）
        NSString *fileName=[PATH_OF_DOCUMENT stringByAppendingPathComponent:@"userInfo"]; 
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:user.userName,@"username",user.password,@"password",nil];
        //将Dictionary转换成NSData
        NSString *error;
        NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:(id)dict
                                                                       format:NSPropertyListXMLFormat_v1_0 
                                                             errorDescription:&error];
        //写文件
        if (plistData) {
            [plistData writeToFile:fileName atomically:YES];
        }
    }
    
    //将当前的帐号写入文件
    NSString *fileName=[PATH_OF_DOCUMENT stringByAppendingPathComponent:@"currentUserInfo"]; 
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:user.userName,@"username",user.password,@"password",user.sessionKey,@"sessionkey", nil];
    //将Dictionary转换成NSData
    NSString *error;
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:(id)dict
                                                                   format:NSPropertyListXMLFormat_v1_0 
                                                         errorDescription:&error];
    //写文件
    if (plistData) {
        [plistData writeToFile:fileName atomically:YES];
    }
    */
     
    //组装TabbarController
    
    IndexViewController *index = [[[IndexViewController alloc] init] autorelease];
    UIImage *indexImg =[UIImage imageNamed:@"homeItem"];
    UITabBarItem *indexItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:indexImg tag:100];   
    [index setTabBarItem:indexItem];
    [indexItem release];
    //[index setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:100]];
    [index setTitle:@"首页"];
    UINavigationController *navVC1 = [[UINavigationController alloc] initWithRootViewController:index];
    
    OtherViewController *other = [[[OtherViewController alloc] init] autorelease];
    UIImage *otherImg = [UIImage imageNamed:@"business"];
    UITabBarItem *otherItem = [[UITabBarItem alloc] initWithTitle:@"其它" image:otherImg tag:102];
    //[other setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:101]];
    [other setTabBarItem:otherItem];
    [otherItem release];
    [other setTitle:@"其它"];
    UINavigationController *navVC2 = [[UINavigationController alloc] initWithRootViewController:other];
    
    
    MoreViewController *more = [[[MoreViewController alloc] init] autorelease];
    UIImage *moreImg = [UIImage imageNamed:@"settItem"];
    UITabBarItem *moreItem = [[UITabBarItem alloc] initWithTitle:@"更多" image:moreImg tag:102];
    [more setTabBarItem:moreItem];
    [moreItem release];
    UINavigationController *navVC3 = [[UINavigationController alloc] initWithRootViewController:more];
    [more.navigationItem setTitle:@"更多"];
    
    UITabBarController *tabBarController = [[[UITabBarController alloc] init] autorelease];
    
    [tabBarController setViewControllers:[NSArray arrayWithObjects:navVC1, navVC2, navVC3, nil]];
    
    [navVC1 release];
    [navVC2 release];
    [navVC3 release];
    
    [[self navigationController] pushViewController:tabBarController animated:YES];
    

       
    
    
    
}


-(void) doLoginTask
{
    //sleep(3);
    NSString *userName = [tfUserName text];
    NSString *password = [tfPassword text]; 
    MKNetworkEngine *engine = [[[MKNetworkEngine alloc] initWithHostName:@"xs.zj165.com/API"
                                                      customHeaderFields:nil] autorelease];
    NSMutableDictionary *dic = [[[NSMutableDictionary alloc] init] autorelease];
    [dic setValue:@"user.login" forKey:@"method"];
    [dic setValue:@"1.0" forKey:@"v"];
    [dic setValue:@"iphone" forKey:@"appkey"];
    [dic setValue:@"308c982d146cbb85297621658d6b5ecc17b184cd" forKey:@"sig"];
    [dic setValue:userName forKey:@"username"];
    [dic setValue:password forKey:@"password"];
    
    MKNetworkOperation *op = [engine operationWithPath:@"api" params:dic httpMethod:@"POST"];
    [op onCompletion:^(MKNetworkOperation *operation) {
        NSLog(@"post response string :%@",[op responseString]);
        DataModelUser *user = [DataParser getUserInfo:[op responseString]];
        NSLog(@"user name is :%@,password is : %@ ,and sessionkey is :%@",user.userName,user.password,user.sessionKey);
        if (user) {
            //login sucess
            [self loginSuccess:user];
        } else {
            //user name or pass error
            NSLog(@"----------error---------");
            [ToolSet showMessage:@"用户名或密码错误" view:self.view];
        }
    } onError:^(NSError *error) {
        [ToolSet showMessage:@"网络连接错误" view:self.view];
        DLog(@"%@", error);
    }];
    
    [engine enqueueOperation:op];
}




#pragma mark -
#pragma mark 所有button点击时的action
//记住密码
-(void) btnRemmberPasClick:(id) sender
{
    debugMethod();
    UIButton *btn = (UIButton *)sender;
    if (appDelegate.isRemberPas==NO) {
        [btn setBackgroundImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateNormal];
        appDelegate.isRemberPas = YES;
    } else {
        [btn setBackgroundImage:[UIImage imageNamed:@"checkbox_nor"] forState:UIControlStateNormal];
        appDelegate.isRemberPas = NO;
    }
    
    
}
//Login
-(void) btnLoginClick:(id) sender
{
    NSLog(@"userName:%@",tfUserName.text);
    NSLog(@"password:%@",tfPassword.text);

    MBProgressHUD* hud = [[MBProgressHUD alloc] initWithView:self.view];
	[self.view addSubview:hud];
    hud.labelText = @"Login...";
    //block模式
    [hud showAnimated:YES whileExecutingBlock:^{
        [self doLoginTask];
        
        //[self loginSuccess:nil];
        
    } completionBlock:^{
        [hud removeFromSuperview];
		[hud release];
    }];

    
    
    
}






#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
   
    //左边标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 30)];
    label.textAlignment = UITextAlignmentLeft;
    label.font = [UIFont boldSystemFontOfSize:16];
    label.backgroundColor = [UIColor clearColor];
    
    if([indexPath row] == 0){
        label.text = @"帐号：";
    } else {
        label.text = @"密码：";
    }
    [cell.contentView addSubview:label];
    [label release];

    //右边输入框
    if([indexPath row] == 0) // 0
    { 
        
        tfUserName = [[UITextField alloc] initWithFrame:
                      CGRectMake(90, 14, 200, 30)];
        tfUserName.clearsOnBeginEditing = NO;
        
        [tfUserName setDelegate:self];
        [tfUserName addTarget:self 
                       action:nil
             forControlEvents:UIControlEventEditingDidEndOnExit];
        tfUserName.returnKeyType = UIReturnKeyDone;
        tfUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
        tfUserName.text = @"571000033XS";
        tfUserName.placeholder = @"输入帐号";
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:tfUserName];
        [tfUserName release];
        
    }
    
    if([indexPath row] == 1) // 1
    {	
        tfPassword = [[UITextField alloc] initWithFrame:
                      CGRectMake(90, 14, 200, 30)];
        tfPassword.clearsOnBeginEditing = NO;
        
        [tfPassword setDelegate:self];
        [tfPassword addTarget:self 
                       action:nil
             forControlEvents:UIControlEventEditingDidEndOnExit];
        tfPassword.returnKeyType = UIReturnKeyDone;
        tfPassword.clearButtonMode = UITextFieldViewModeWhileEditing;
        tfPassword.placeholder = @"输入密码";
        tfPassword.text = @"123456";
        tfPassword.secureTextEntry = YES;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:tfPassword];
        [tfPassword release];
    }

//    mtextField.keyboardAppearance = UIKeyboardAppearanceAlert;
//    mtextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    mtextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
//    [cell.contentView addSubview:mtextField];
//    [mtextField release];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -
#pragma mark textField代理

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    isEdit = YES;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [loginTableView setFrame:CGRectMake(0.0f, 90.0f, 320.0f, 230.0f)];
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (isEdit != YES) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        [loginTableView setFrame:CGRectMake(0.0f, 200.0f, 320.0f, 230.0f)];
        [UIView commitAnimations];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    isEdit = NO;
    //[tfPassword resignFirstResponder];
    //[tfUserName resignFirstResponder];
    [ToolSet cancelKeyBoard:self.view];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    if (loginTableView) {
        [loginTableView release];
        loginTableView = nil;
    }
    if(tfUserName){
        [tfUserName release];
        tfUserName = nil;
    }
    if(tfPassword){
        [tfPassword release];
        tfPassword = nil;
    }
    
    
}

- (void)dealloc {
    
    if (loginTableView) {
        [loginTableView release];
        loginTableView = nil;
    }
    if(tfUserName){
        [tfUserName release];
        tfUserName = nil;
    }
    if(tfPassword){
        [tfPassword release];
        tfPassword = nil;
    }

    [super dealloc];
}

-(void)hudWasHidden:(MBProgressHUD *)hud
{   
    debugMethod();
    [hud release];
    hud = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
