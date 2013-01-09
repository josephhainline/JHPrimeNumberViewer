//
//  JHAppDelegate.h
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHPrimeNumberModel.h"

@interface JHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *mainVC;
@property (strong, nonatomic) JHPrimeNumberModel* model;

@end
