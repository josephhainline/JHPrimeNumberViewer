#define CellReuseIdentifier @"JHPrimesTableViewCell"

#import "JHMainViewController.h"

@interface JHMainViewController ()

@property(nonatomic, strong) JHPrimeNumberModel *primesModel;

@end


@implementation JHMainViewController

- (id)initWithModel:(JHPrimeNumberModel *)model {
    self = [super init];
    if (self) {
        self.primesModel = model;
    }
    return self;
}

@end
