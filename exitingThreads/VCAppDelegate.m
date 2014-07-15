//
//  VCAppDelegate.m
//  exitingThreads
//
//  Created by vincent on 2014/07/15.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "VCAppDelegate.h"

@interface VCAppDelegate ()

@property (nonatomic, strong) NSThread *myThread;

@end

@implementation VCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.myThread = [[NSThread alloc] initWithTarget:self
                                            selector:@selector(threadEntryPoint)
                                              object:nil];
    
    [self performSelector:@selector(stopThread) withObject:nil afterDelay:3.0f];
    
    [self.myThread start];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Thread Operations

- (void)threadEntryPoint
{
    @autoreleasepool {
        NSLog(@"Thread Entry Point");
        
        while ([[NSThread currentThread] isCancelled] == NO) {
            
            [NSThread sleepForTimeInterval:4.0f];
            
            if ([[NSThread currentThread] isCancelled] == NO) {
                NSLog(@"Thread Loop");
            }

        }
        
        NSLog(@"Thread Finished");
    }
}

- (void)stopThread {
    NSLog(@"Thread Canceling");
    [self.myThread cancel];
    
    NSLog(@"Thread Releasing");
    self.myThread = nil;
}

@end
