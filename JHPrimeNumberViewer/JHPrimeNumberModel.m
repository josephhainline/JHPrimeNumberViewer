//
//  JHPrimeNumberModel.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import "JHPrimeNumberModel.h"

@interface JHPrimeNumberModel ()

@property (nonatomic, strong) NSMutableArray* primes;

@end


@implementation JHPrimeNumberModel

- (id)init {
    self = [super init];
    if (self) {
        self.primes = [[NSMutableArray alloc] init];
        [self.primes addObject:[NSNumber numberWithInt:1]];
        [self.primes addObject:[NSNumber numberWithInt:2]];
    }
    return self;
}

- (BOOL)isPrimeNumber:(int)x {
    while (x > [self.primes.lastObject intValue]) {
        [self calculateNextPrime];
    }
    
    if ([self.primes containsObject:[NSNumber numberWithInt:x]]) {
        return YES;
    } else {
        return NO;
    }
}

- (void)calculateNextPrime {
    int lastKnownPrime = [self highestKnownPrime];
    
    BOOL found = NO;
    for (int candidate = lastKnownPrime + 1; !found; ++candidate) {
        BOOL divisibleByAnyPrime = NO;
        for (NSNumber *primeNum in self.primes) {
            int primeInt = [primeNum intValue];
            if (primeInt == 1) continue;
            if (candidate % primeInt == 0) {
                divisibleByAnyPrime = YES;
            }
        }
        if (!divisibleByAnyPrime) {
            [self addKnownPrime:candidate];
            found = YES;
        }
    }
}

- (int)highestKnownPrime {
    return [self.primes.lastObject intValue];
}

- (int)numberOfKnownPrimes {
    return self.primes.count;
}

- (NSArray *)allCalculatedPrimes {
    return self.primes;
}

#pragma mark - private methods

- (void)addKnownPrime:(int)prime {
    [self.primes addObject:[NSNumber numberWithInt:prime]];
}

@end
