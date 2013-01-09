//
//  JHAppDelegate.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import "JHAppDelegate.h"
#import "JHMainViewController.h"

@implementation JHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.model = [[JHPrimeNumberModel alloc] init];
    [self.model isPrimeNumber:80];

    self.mainVC = [[JHMainViewController alloc] initWithModel:self.model];

    self.window.rootViewController = self.mainVC;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
