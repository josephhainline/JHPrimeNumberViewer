//
//  JHMainViewController.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/8/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

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

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(addRowToTable)
                                                     name:JHPrimeNumberModelNewPrimeGenerated
                                                   object:self.primesModel];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addRowToTable {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.primesModel.numberOfKnownPrimes-1 inSection:0];
    NSArray *indexPathArray = [NSArray arrayWithObject:indexPath];
    [self.primesTableView insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.primesModel.numberOfKnownPrimes;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JHPrimesTableViewCell"];

    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }

    NSNumber *primeNum = [self.primesModel.allCalculatedPrimes objectAtIndex:indexPath.row];
    int primeInt = [primeNum intValue];
    cell.textLabel.text = [NSString stringWithFormat:@"%i", primeInt];

    if (primeInt == self.primesModel.highestKnownPrime) {
        [self.primesModel calculateNextPrime];
    }

    return cell;
}

@end
