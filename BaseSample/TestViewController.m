//
//  TestViewController.m
//  BaseSample
//
//  Created by qian jin on 12-11-13.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "TestViewController.h"
#import "ToolSet.h"

@implementation TestViewController

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
    UIImageView *loginBgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH,UI_SCREEN_HEIGHT)];
    loginBgImageView.image = [UIImage imageNamed:@"bg_sand"];
    [self.view addSubview:loginBgImageView];
    [loginBgImageView release];
    
    
    UIButton* btnTest = [ToolSet buttonNormal:@"test" target:self selector:@selector(btnTestClick:) frame:CGRectMake(100, 100, 150, UI_BUTTON_HEIGHT)];
    [self.view addSubview:btnTest];
    
}

-(void) btnTestClick:(id) sender
{
    //[self requestByGet:@"vas_list.php?openid=215715a150f27ef36a992ba8f9c0b70d&typeid=193&listType=1&start=0&limit=20"];



    networkEngine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME
                                            customHeaderFields:nil];
    
    
//        NSMutableDictionary *dic = [[[NSMutableDictionary alloc] init] autorelease];
//        [dic setValue:@"user.login" forKey:@"method"];
//        [dic setValue:@"1.0" forKey:@"v"];
//        [dic setValue:@"iphone" forKey:@"appkey"];
//        [dic setValue:@"308c982d146cbb85297621658d6b5ecc17b184cd" forKey:@"sig"];
//        [dic setValue:@"571000033XS" forKey:@"username"];
//        [dic setValue:@"123456" forKey:@"password"];
//        MKNetworkOperation* op1 = [self requestByPost:@"API/api" params:dic];
        
    
    
        NSMutableDictionary *params = [[[NSMutableDictionary alloc] init] autorelease];
        [params setValue:@"user.info" forKey:@"method"];
        [params setValue:@"1.0" forKey:@"v"];
        [params setValue:@"iphone" forKey:@"appkey"];
        [params setValue:@"308c982d146cbb85297621658d6b5ecc17b184cd" forKey:@"sig"];
        [params setValue:@"43c07b703d3c0abcbf05d2c2984e3bdd6ff3bde5" forKey:@"sessionkey"];
        
        MKNetworkOperation *op = [self requestByPost:@"API/api" params:params];
        
        //[networkEngine enqueueOperation:op1];
       [networkEngine enqueueOperation:op];
       [networkEngine release];
       
   // });
    

    //[super getPaserHelper:@"vas_list.php?openid=215715a150f27ef36a992ba8f9c0b70d&typeid=193&listType=1&start=0&limit=20" :0];
    
}

-(void)responseReturnSuccess:(NSString *)json url:(NSString *)url
{
    NSLog(@"返回的JSON是:%@",json);
    
    NSLog(@"url is:%@",url);
    
    
    //[ToolSet messagebox:json];
    
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
