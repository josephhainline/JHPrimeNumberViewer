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
        [self.primes addObject:[NSNumber numberWithInt:2]];
        [self.primes addObject:[NSNumber numberWithInt:3]];
    }
    return self;
}

- (id)initWithNumberOfPrimesToCalculate:(int)numPrimes {
    self = [self init];
    if (self) {
        while ([self numberOfKnownPrimes] < numPrimes) {
            [self calculateNextPrime];
        }
    }
    return self;
}

- (BOOL)isPrime:(int)number {
    while (number > [self.primes.lastObject intValue]) {
        [self calculateNextPrime];
    }
    
    if ([self.primes containsObject:[NSNumber numberWithInt:number]]) {
        return YES;
    } else {
        return NO;
    }
}

- (int)xthPrime:(int)x {
    int result;
    if (x < 1) {
        result = 1;
    } else {
        if (self.numberOfKnownPrimes >= x) {
            result = [[self.primes objectAtIndex:x -1] intValue];
        } else {
            while ([self numberOfKnownPrimes] < x) {
                [self calculateNextPrime];
            }
            result = self.highestKnownPrime;
        }
    }
    return result;
}

- (void)calculateNextPrime {
    int lastKnownPrime = [self highestKnownPrime];
    
    BOOL found = NO;
    for (int candidate = lastKnownPrime + 1; !found; ++candidate) {
        BOOL divisibleByAnyPrime = NO;
        for (NSNumber *primeNum in self.primes) {
            int primeInt = [primeNum intValue];

            if (primeInt > sqrt(candidate)) break; //out of inner loop

            if (candidate % primeInt == 0) {
                divisibleByAnyPrime = YES;
            }
        }
        if (!divisibleByAnyPrime) {
            [self addKnownPrime:candidate];
            found = YES;
        }
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:JHPrimeNumberModelNewPrimeGenerated object:self];
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
