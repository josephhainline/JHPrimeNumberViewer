//
//  JHPrimeNumberModelTests.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "JHPrimeNumberModel.h"

@interface JHPrimeNumberModelTests : GHTestCase {
    JHPrimeNumberModel *testSubject;
}

@end


@implementation JHPrimeNumberModelTests

- (void)setUp {
    testSubject = [[JHPrimeNumberModel alloc] init];
}

- (void)testOneIsPrime {
    int numberToTest = 1;
    GHAssertTrue([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)testTwoIsPrime {
    int numberToTest = 2;
    GHAssertTrue([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)testKnownPrimesAreAccessible {
    NSArray *knownPrimes = @[@1, @2];

    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];

    GHAssertTrue(calculatedPrimes.count == 2, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)testCanCalculateThreeIsPrime {
    NSArray *knownPrimes = @[@1, @2, @3];
    
    [testSubject calculateNextPrime];
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 3, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)test4IsNotPrime {
    int numberToTest = 4;
    GHAssertFalse([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)test7IsPrime {
    int numberToTest = 7;
    GHAssertTrue([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)testPreviouslyCalculatedPrimesAreAccessible {
    NSArray *knownPrimes = @[@1, @2, @3, @5];
    [testSubject isPrimeNumber:5];
    
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 4, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)test30IsNotPrime {
    int numberToTest = 30;
    GHAssertFalse([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)test23IsThe10thPrime {
    int numberToTest = 23;
    [testSubject isPrimeNumber:numberToTest];
    
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 10, nil);
    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
}

- (void)testHighestKnownPrimeIs29When29IsCalculated {
    [testSubject isPrimeNumber:29];
    
    GHAssertTrue([testSubject highestKnownPrime] == 29, nil);
}

- (void)test523IsThe100thPrime {
    int numberToTest = 523;
    [testSubject isPrimeNumber:numberToTest];
    
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 100, nil);
    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
}

- (void)test3559IsThe500thPrime {
    int numberToTest = 3559;
    [testSubject isPrimeNumber:numberToTest];
    
    GHAssertTrue([testSubject numberOfKnownPrimes] == 500, nil);
    GHAssertTrue([testSubject highestKnownPrime] == numberToTest, nil);
}

@end
