//
//  JHMainViewController.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/8/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#define CellReuseIdentifier @"JHPrimesTableViewCell"

#import "JHMainViewController.h"

@interface JHMainViewController ()

@property(nonatomic, strong) JHPrimeNumberModel *primesModel;
@property(nonatomic, strong) UITableView *primesTableView;

@end


@implementation JHMainViewController

- (id)initWithModel:(JHPrimeNumberModel *)model {
    self = [super init];
    if (self) {
        self.primesModel = model;
        self.primesTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.view = self.primesTableView;
        self.primesTableView.delegate = self;
        self.primesTableView.dataSource = self;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellReuseIdentifier];
    }
    
    int n = indexPath.row + 1;
    int primeInt = [self.primesModel nthPrime:n];
    cell.textLabel.text = [NSString stringWithFormat:@"%i", primeInt];
    return cell;
}

@end
