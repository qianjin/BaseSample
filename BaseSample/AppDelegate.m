//
//  AppDelegate.m
//  BaseSample
//
//  Created by qian jin on 12-10-31.
//  Copyright (c) 2012年 newyulong. All rights reserved.
//

#import "AppDelegate.h"
#import "ToolSet.h"
#import "LoginViewController.h"

@implementation UINavigationBar (CustomImage)  
- (void)drawRect:(CGRect)rect {  
    UIImage *image = [UIImage imageNamed: @"image_topBar.png"];  
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];  
}  
@end

@implementation AppDelegate

AppDelegate *appDelegate;

@synthesize window = _window;
@synthesize viewController = _viewController;

//自定义的一些全局变量
@synthesize isRemberPas;



- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}


-(void)customizeAppearance
{
    
    
    //self.view.backgroundColor = 
    
    
#ifdef __IPHONE_5_0
    
float version = [[[UIDevice currentDevice] systemVersion] floatValue];
if (version >= 5.0)
{
    //得到二张可变大小的图片
    UIImage *gradientImage44 = [[UIImage imageNamed:@"image_topBar"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIImage *gradientImage32 = [[UIImage imageNamed:@"surf_gradient_textured_32"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    //设置背景
    [[UINavigationBar appearance] setBackgroundImage:gradientImage44 forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:gradientImage32 forBarMetrics:UIBarMetricsLandscapePhone];
    
    //设置标题的一些样式
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys: 
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], 
      UITextAttributeTextColor, 
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], 
      UITextAttributeTextShadowColor, 
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)], 
      UITextAttributeTextShadowOffset, 
      [UIFont fontWithName:@"Arial-Bold" size:0.0], 
      UITextAttributeFont, 
      nil]];
    
    
    //设置UIBarButtonItem的一些样式
    UIImage *button30 = [[UIImage imageNamed:@"button_textured_30"] 
                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    UIImage *button24 = [[UIImage imageNamed:@"button_textured_24"] 
                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    [[UIBarButtonItem appearance] setBackgroundImage:button30 forState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackgroundImage:button24 forState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsLandscapePhone];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:220.0/255.0 green:104.0/255.0 blue:1.0/255.0 alpha:1.0], 
      UITextAttributeTextColor, 
      [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0], 
      UITextAttributeTextShadowColor, 
      [NSValue valueWithUIOffset:UIOffsetMake(0, 1)], 
      UITextAttributeTextShadowOffset, 
      [UIFont fontWithName:@"AmericanTypewriter" size:0.0], 
      UITextAttributeFont, 
      nil] forState:UIControlStateNormal];
    
    //设置UIbarButtonItem“返回”按键的背景
    UIImage *buttonBack30 = [[UIImage imageNamed:@"button_back_textured_30"] 
                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];
    UIImage *buttonBack24 = [[UIImage imageNamed:@"button_back_textured_24"] 
                             resizableImageWithCapInsets:UIEdgeInsetsMake(0, 12, 0, 5)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack30 
                                                      forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack24 
                                                      forState:UIControlStateNormal barMetrics:UIBarMetricsLandscapePhone];
    
    //设置UITabBar背景和选中时图片
//    UIImage *tabBackground = [[UIImage imageNamed:@"imageTabbar"] 
//                              resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//    [[UITabBar appearance] setBackgroundImage:tabBackground];//背景
//    [[UITabBar appearance] setSelectionIndicatorImage:
//    [UIImage imageNamed:@"tab_select_indicator"]];//设置选中时的图片
    //[[UITabBarItem appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tab_select_indicator"]];
    
    //自定义slider
    UIImage *minImage = [[UIImage imageNamed:@"slider_minimum.png"] 
                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    UIImage *maxImage = [[UIImage imageNamed:@"slider_maximum.png"] 
                         resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    UIImage *thumbImage = [UIImage imageNamed:@"thumb.png"];
    
    [[UISlider appearance] setMaximumTrackImage:maxImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setMinimumTrackImage:minImage 
                                       forState:UIControlStateNormal];
    [[UISlider appearance] setThumbImage:thumbImage 
                                forState:UIControlStateNormal];
    
    //自定义segmentSelected
    UIImage *segmentSelected = 
    [[UIImage imageNamed:@"segcontrol_sel.png"] 
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentUnselected = 
    [[UIImage imageNamed:@"segcontrol_uns.png"] 
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentSelectedUnselected = 
    [UIImage imageNamed:@"segcontrol_sel-uns.png"];
    UIImage *segUnselectedSelected = 
    [UIImage imageNamed:@"segcontrol_uns-sel.png"];
    UIImage *segmentUnselectedUnselected = 
    [UIImage imageNamed:@"segcontrol_uns-uns.png"];
    
    [[UISegmentedControl appearance] setBackgroundImage:segmentUnselected 
                                               forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:segmentSelected 
                                               forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    [[UISegmentedControl appearance] setDividerImage:segmentUnselectedUnselected 
                                 forLeftSegmentState:UIControlStateNormal 
                                   rightSegmentState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected 
                                 forLeftSegmentState:UIControlStateSelected 
                                   rightSegmentState:UIControlStateNormal 
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] 
     setDividerImage:segUnselectedSelected 
     forLeftSegmentState:UIControlStateNormal 
     rightSegmentState:UIControlStateSelected 
     barMetrics:UIBarMetricsDefault];
} else if (version < 5.0){
    
    //[[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"image_topBar"]]];
//    UIImage *image = [UIImage imageNamed: @"image_topBar.png"];
//    [[UINavigationBar appearance] drawRect: [image drawInRect:CGRectMake(0, 0, 320, 44)]];
//    
    // self.navigationController.navigationBar
   
    
    
}
    
#endif  


}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self customizeAppearance];
    
    appDelegate = (AppDelegate *)self;
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    LoginViewController *loginViewController = [[[LoginViewController alloc] init] autorelease];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    
    [navController setNavigationBarHidden:YES animated:NO];
    
    
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;

    
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
