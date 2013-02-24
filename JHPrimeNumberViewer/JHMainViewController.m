#define CellReuseIdentifier @"JHPrimesTableViewCell"

#import "JHMainViewController.h"

@interface JHMainViewController () <UITableViewDataSource, UITableViewDelegate>

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
    cell.textLabel.text = [NSString stringWithFormat:@"%i     is the %i%@ prime", primeInt, n, [self printableEndingFromInt:n]];
    return cell;
}

- (NSString *)printableEndingFromInt:(int)x {
    switch (x) {
        case 1:
            return @"st";
            break;

        case 2:
            return @"nd";
            break;

        case 3:
            return @"rd";
            break;
    
        default:
            return @"th";
            break;
    }
}

@end
