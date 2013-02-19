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

@interface JHPrimeNumberModelTests : GHTestCase {}

@property (nonatomic) JHPrimeNumberModel *testSubject;

@end


@implementation JHPrimeNumberModelTests

- (void)setUp {
    self.testSubject = [[JHPrimeNumberModel alloc] init];
}

- (void)testOneIsNotPrime {
    int numberToTest = 1;
    GHAssertFalse([self.testSubject isPrime:numberToTest], nil);
}

- (void)testTwoIsPrime {
    int numberToTest = 2;
    GHAssertTrue([self.testSubject isPrime:numberToTest], nil);
}

- (void)testThreeIsPrime {
    int numberToTest = 3;
    GHAssertTrue([self.testSubject isPrime:numberToTest], nil);
}

- (void)testKnownPrimesAreAccessible {
    NSArray *knownPrimes = @[@2, @3];

    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];

    GHAssertTrue(calculatedPrimes.count == 2, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)testCanCalculateFiveIsPrime {
    NSArray *knownPrimes = @[@2, @3, @5];
    
    [self.testSubject calculateNextPrime];
    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 3, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)test4IsNotPrime {
    int numberToTest = 4;
    GHAssertFalse([self.testSubject isPrime:numberToTest], nil);
}

- (void)test7IsPrime {
    int numberToTest = 7;
    GHAssertTrue([self.testSubject isPrime:numberToTest], nil);
}

- (void)testPreviouslyCalculatedPrimesAreAccessible {
    NSArray *knownPrimes = @[@2, @3, @5];
    [self.testSubject isPrime:5];
    
    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 3, nil);
    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
}

- (void)test30IsNotPrime {
    int numberToTest = 30;
    GHAssertFalse([self.testSubject isPrime:numberToTest], nil);
}

- (void)test29IsThe10thPrime {
    int numberToTest = 29;
    [self.testSubject isPrime:numberToTest];
    
    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 10, nil);
    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
}

- (void)testHighestKnownPrimeIs29When29IsCalculated {
    [self.testSubject isPrime:29];
    
    GHAssertTrue([self.testSubject highestKnownPrime] == 29, nil);
}

- (void)test541IsThe100thPrime {
    int numberToTest = 541;
    [self.testSubject isPrime:numberToTest];
    
    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
    
    GHAssertTrue(calculatedPrimes.count == 100, nil);
    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
}

- (void)test3571IsThe500thPrime {
    int numberToTest = 3571;
    [self.testSubject isPrime:numberToTest];
    
    GHAssertTrue([self.testSubject numberOfKnownPrimes] == 500, nil);
    GHAssertTrue([self.testSubject highestKnownPrime] == numberToTest, nil);
}

- (void)testCanBeInitializedWithNumberOfPrimesToCalculate {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
    GHAssertTrue([testSubject numberOfKnownPrimes] == 15, nil);
}

- (void)testCanAskFor100thPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
    int hundrethPrime = [testSubject xthPrime:100];
    GHAssertTrue(hundrethPrime == 541, nil);
}

- (void)testCanAskFor101stPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
    int hundredNFirstPrime = [testSubject xthPrime:101];
    GHAssertTrue(hundredNFirstPrime == 547, nil);
}

- (void)testCanAskFor0thPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
    int zerothPrime = [testSubject xthPrime:0];
    GHAssertTrue(zerothPrime == 1, nil);
}

- (void)testCanAskForNegativeFirstPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
    int negOnePrime = [testSubject xthPrime:-1];
    GHAssertTrue(negOnePrime == 1, nil);
}

- (void)testCanAskFor10thThen5thThen4thPrime {
    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
    int tenthPrime = [testSubject xthPrime:10];
    int fifthPrime = [testSubject xthPrime:5];
    int fourthPrime = [testSubject xthPrime:4];
    GHAssertTrue(tenthPrime == 29, nil);
    GHAssertTrue(fifthPrime == 11, nil);
    GHAssertTrue(fourthPrime == 7, nil);
}

@end
