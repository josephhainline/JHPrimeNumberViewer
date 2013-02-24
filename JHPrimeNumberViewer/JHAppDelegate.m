#import "JHAppDelegate.h"
#import "JHMainViewController.h"

@implementation JHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.model = [[JHPrimeNumberModel alloc] init];
    self.mainVC = [[JHMainViewController alloc] initWithModel:self.model];

    self.window.rootViewController = self.mainVC;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
