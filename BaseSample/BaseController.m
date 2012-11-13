//
//  BaseController.m
//  BaseSample
//
//  Created by qian jin on 12-11-13.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "BaseController.h"
#import "ToolSet.h"

@implementation BaseController

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

-(void)requestByGet:(NSString *)url
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
	//HUD.dimBackground = YES;
    [self.view addSubview:HUD];
    HUD.delegate = self;
    [HUD show:YES];
    networkEngine = [[[MKNetworkEngine alloc] initWithHostName:HOST_NAME
                                                      customHeaderFields:nil] autorelease];
    MKNetworkOperation *op = [networkEngine operationWithPath:url params:nil httpMethod:@"GET"];
    [op onCompletion:^(MKNetworkOperation *operation){
        //NSLog(@"request string: %@",[op responseString]);
        [self responseReturnSuccess:[operation responseString] url:url];
        [HUD hide:YES];
    } 
    onError:^(NSError *error){
        [HUD hide:YES];
        [ToolSet messagebox:@"联网出错！"];
        DLog(@"%@", error);
    }];
    [networkEngine enqueueOperation:op];
}

-(MKNetworkOperation *)requestByPost:(NSString *)url params:(NSMutableDictionary *)params
{
    //HUD = [[MBProgressHUD alloc] initWithView:self.view];
	//HUD.dimBackground = YES;
    //[self.view addSubview:HUD];
    //HUD.delegate = self;
    //[HUD show:YES];
    
    //networkEngine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME
    //                                        customHeaderFields:nil];
    MKNetworkOperation *op = [networkEngine operationWithPath:url params:params httpMethod:@"POST"];
    
    [op onCompletion:^(MKNetworkOperation *operation){
        [self responseReturnSuccess:[operation responseString] url:url];
        //[HUD hide:YES];
    } 
    onError:^(NSError *error){
        //[HUD hide:YES];
        //[HUD removeFromSuperview];
        //[HUD release];
        [ToolSet messagebox:@"联网出错！"];
        DLog(@"%@", error);
    }];
    //[networkEngine enqueueOperation:op];
    //[networkEngine release];
    
    return op;
}


#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    if (HUD) {
        [HUD release];
        HUD = nil;
    }
    if (networkEngine) {
        [networkEngine release];
        networkEngine = nil;
    }
}

- (void)dealloc {
    
    NSLog(@"----------");
    
    if (HUD) {
        [HUD release];
        HUD = nil;
    }
    
    
    
    [super dealloc];
}

-(void)hudWasHidden:(MBProgressHUD *)hud
{
    if(hud){
        [hud removeFromSuperview];
        [hud release];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
