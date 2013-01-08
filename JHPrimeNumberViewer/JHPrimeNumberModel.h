//
//  JHPrimeNumberModel.h
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHPrimeNumberModel : NSObject

- (BOOL)isPrimeNumber:(int)number;
- (NSArray *)allCalculatedPrimes;
- (void)calculateNextPrime;
- (int)highestKnownPrime;
- (int)numberOfKnownPrimes;

@end
