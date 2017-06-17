//
//  AppDelegate.m
//  WatchApp
//
//  Created by Eirik Halvorsen on 12/05/2017.
//  Copyright © 2017 Eirik Halvorsen. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

void (^fetchCompletionHandler)(UIBackgroundFetchResult);
UIBackgroundTaskIdentifier backgroundTask;
NSDate *fetchStart;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:30];
    //UIApplicationBackgroundFetchIntervalMinimum
    
    return YES;
}


-(void)checkWatchData {
    UIBackgroundFetchResult result;
    
    
    ViewController *viewController = (ViewController *)self.window.rootViewController;
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        [session setDelegate:viewController];
        [session activateSession];
        
        result = UIBackgroundFetchResultNewData;
    }
    else {
        NSLog(@"WATCH_APP: Not supported???");
        result = UIBackgroundFetchResultFailed;
    }
    
    
    NSDate *fetchEnd = [NSDate date];
    NSTimeInterval timeElapsed = [fetchEnd timeIntervalSinceDate:fetchStart];
    NSLog(@"Background Fetch Duration: %f seconds", timeElapsed);
    
    fetchCompletionHandler(result);
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    fetchCompletionHandler = completionHandler;
    
    fetchStart = [NSDate date];
    
    [self checkWatchData];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
