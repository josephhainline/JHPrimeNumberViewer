//
//  JHPrimeNumberModel.h
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <Foundation/Foundation.h>

#define JHPrimeNumberModelNewPrimeGenerated @"newPrimeGenerated"

@interface JHPrimeNumberModel : NSObject

- (id)init;
- (id)initWithNumberOfPrimesToCalculate:(int)numPrimes;

- (BOOL)isPrimeNumber:(int)number;
- (int)getXthPrimeNumber:(int)xthNumber;
- (NSArray *)allCalculatedPrimes;
- (void)calculateNextPrime;
- (int)highestKnownPrime;
- (int)numberOfKnownPrimes;

@end
