//
//  VCAppDelegate.m
//  exitingThreads
//
//  Created by vincent on 2014/07/15.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "VCAppDelegate.h"

@implementation VCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
