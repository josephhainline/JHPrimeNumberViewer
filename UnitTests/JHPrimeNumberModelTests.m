//
//  JHPrimeNumberModelTests.m
//  JHPrimeNumberViewer
//
//  Created by Joseph Hainline on 1/7/13.
//  Copyright (c) 2013 Joseph Hainline. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "JHPrimeNumberModel.h"
#import "OCMock.h"

@interface JHPrimeNumberModelTests : GHTestCase {
    JHPrimeNumberModel *testSubject;
}

@end


@implementation JHPrimeNumberModelTests

- (void)setUp {
    testSubject = [[JHPrimeNumberModel alloc] init];
}

- (void)testOneIsNotPrime {
    int numberToTest = 1;
    GHAssertFalse([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)testTwoIsPrime {
    int numberToTest = 2;
    GHAssertTrue([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)testThreeIsPrime {
    int numberToTest = 3;
    GHAssertTrue([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)testKnownPrimesAreAccessible {
    NSArray *knownPrimes = @[@2, @3];

    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];

    GHAssertTrue(calculatedPrimes.count == 2, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)testCanCalculateFiveIsPrime {
    NSArray *knownPrimes = @[@2, @3, @5];
    
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
    NSArray *knownPrimes = @[@2, @3, @5];
    [testSubject isPrimeNumber:5];
    
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 3, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)test30IsNotPrime {
    int numberToTest = 30;
    GHAssertFalse([testSubject isPrimeNumber:numberToTest], nil);
}

- (void)test29IsThe10thPrime {
    int numberToTest = 29;
    [testSubject isPrimeNumber:numberToTest];
    
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 10, nil);
    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
}

- (void)testHighestKnownPrimeIs29When29IsCalculated {
    [testSubject isPrimeNumber:29];
    
    GHAssertTrue([testSubject highestKnownPrime] == 29, nil);
}

- (void)test541IsThe100thPrime {
    int numberToTest = 541;
    [testSubject isPrimeNumber:numberToTest];
    
    NSArray *calculatedPrimes = [testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 100, nil);
    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
}

- (void)test3571IsThe500thPrime {
    int numberToTest = 3571;
    [testSubject isPrimeNumber:numberToTest];
    
    GHAssertTrue([testSubject numberOfKnownPrimes] == 500, nil);
    GHAssertTrue([testSubject highestKnownPrime] == numberToTest, nil);
}

- (void)testNotificationIsPostedWhenNewPrimeIsCalculated {
    id notificationObserver = [OCMockObject observerMock];
    [[NSNotificationCenter defaultCenter] addMockObserver:notificationObserver name:JHPrimeNumberModelNewPrimeGenerated object:testSubject];
    [[notificationObserver expect] notificationWithName:JHPrimeNumberModelNewPrimeGenerated object:testSubject];
    
    [testSubject calculateNextPrime];
    
    [notificationObserver verify];
}

- (void)testCanBeInitializedWithNumberOfPrimesToCalculate {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
    GHAssertTrue([testSubject numberOfKnownPrimes] == 15, nil);
}

- (void)testCanAskFor100thPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
    int hundrethPrime = [testSubject getXthPrimeNumber:100];
    GHAssertTrue(hundrethPrime == 541, nil);
}

- (void)testCanAskFor101stPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
    int hundredNFirstPrime = [testSubject getXthPrimeNumber:101];
    GHAssertTrue(hundredNFirstPrime == 547, nil);
}

- (void)testCanAskFor0thPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
    int zerothPrime = [testSubject getXthPrimeNumber:0];
    GHAssertTrue(zerothPrime == 1, nil);
}

- (void)testCanAskForNegativeFirstPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
    int negOnePrime = [testSubject getXthPrimeNumber:-1];
    GHAssertTrue(negOnePrime == 1, nil);
}

- (void)testCanAskFor5thThen4thPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
    int tenthPrime = [testSubject getXthPrimeNumber:10];
    int fifthPrime = [testSubject getXthPrimeNumber:5];
    int fourthPrime = [testSubject getXthPrimeNumber:4];
    GHAssertTrue(tenthPrime == 29, nil);
    GHAssertTrue(fifthPrime == 11, nil);
    GHAssertTrue(fourthPrime == 7, nil);
}


@end
