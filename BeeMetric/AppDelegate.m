//
//  AppDelegate.m
//  BeeMetric
//
//  Created by BeeMetric on 2024/11/20.
//

#import "AppDelegate.h"
#import "DCUniMP.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSMutableDictionary *options = [NSMutableDictionary dictionaryWithDictionary:launchOptions];
    [options setObject:[NSNumber numberWithBool:YES] forKey:@"debug"];
    [DCUniMPSDKEngine initSDKEnvironmentWithLaunchOptions:options];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [DCUniMPSDKEngine applicationDidBecomeActive:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [DCUniMPSDKEngine applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [DCUniMPSDKEngine applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [DCUniMPSDKEngine applicationWillEnterForeground:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [DCUniMPSDKEngine destory];
}


@end
