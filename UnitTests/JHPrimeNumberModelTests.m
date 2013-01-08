//
//  JHPrimeNumberModelTests.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "JHPrimeNumberModel.h"

@interface JHPrimeNumberModelTests : GHTestCase { }

@end


@implementation JHPrimeNumberModelTests

- (void)testOneIsPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] init];
    BOOL isPrime = [testSubject isPrimeNumber:1];
    GHAssertTrue(isPrime, @"%i is a prime number.",1);
}

@end
