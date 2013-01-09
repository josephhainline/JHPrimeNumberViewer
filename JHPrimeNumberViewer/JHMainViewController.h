//
//  JHMainViewController.h
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/8/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHPrimeNumberModel.h"

@interface JHMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (id)initWithModel:(JHPrimeNumberModel *)model;

@end
