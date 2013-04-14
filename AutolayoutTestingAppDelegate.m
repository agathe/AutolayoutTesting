//
//  AppDelegate.m
//  AutolayoutTesting
//
//  Created by Agathe Battestini on 3/27/13.
//  Copyright (c) 2013. All rights reserved.
//

#import "AutolayoutTestingAppDelegate.h"

#import "Scrollview1ViewController.h"
#import "Scrollview2ViewController.h"
#import "InfoViewViewController.h"
#import "TableViewController.h"
#import "FixedHeightTableViewController.h"
#import "AttributedTextViewController.h"


@implementation AutolayoutTestingAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *scVC1 = [[Scrollview1ViewController alloc] initWithNibName:@"Scrollview1ViewController" bundle:nil];
    UIViewController *scVC2 = [[Scrollview2ViewController alloc] initWithNibName:@"Scrollview2ViewController" bundle:nil];
    UIViewController *scVC3 = [[InfoViewViewController alloc] initWithNibName:@"InfoViewViewController" bundle:nil];
    UIViewController *scVC4 = [[TableViewController alloc] initWithNibName:@"TableViewController" bundle:nil];
    UIViewController *scVC5 = [[FixedHeightTableViewController alloc] initWithNibName:@"FixedHeightTableViewController" bundle:nil];
    UIViewController *scVC6 = [[AttributedTextViewController alloc] initWithNibName:@"AttributedTextViewController" bundle:nil];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[scVC1, scVC2, scVC3, scVC2, scVC4, scVC5, scVC6];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
