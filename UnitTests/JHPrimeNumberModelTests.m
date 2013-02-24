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
    GHAssertFalse([self.testSubject isPrime:1], nil);
}

//- (void)testTwoIsPrime {
//    GHAssertTrue([self.testSubject isPrime:2], nil);
//}
//
//- (void)testThreeIsPrime {
//    GHAssertTrue([self.testSubject isPrime:3], nil);
//}
//
//- (void)testFourIsNotPrime {
//    GHAssertFalse([self.testSubject isPrime:4], nil);
//}
//
//- (void)testFiveIsPrime {
//    GHAssertTrue([self.testSubject isPrime:5], nil);
//}
//
//- (void)testKnownPrimesAreAccessible {
//    NSArray *knownPrimes = @[@2, @3, @5];
//
//    [self.testSubject isPrime:1];
//    [self.testSubject isPrime:2];
//    [self.testSubject isPrime:3];
//    [self.testSubject isPrime:4];
//    [self.testSubject isPrime:5];
//    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
//
//    GHAssertTrue(calculatedPrimes.count == 3, nil);
//    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
//}
//
//- (void)test7IsPrime {
//    GHAssertTrue([self.testSubject isPrime:7], nil);
//}
//
//- (void)testKnownPrimesHasNoGaps {
//    NSArray *knownPrimes = @[@2, @3, @5, @7, @11];
//    
//    [self.testSubject isPrime:11];
//    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
//    
//    GHAssertTrue(calculatedPrimes.count == 5, nil);
//    GHAssertEqualObjects(calculatedPrimes, knownPrimes, nil);
//}
//
//- (void)test30IsNotPrime {
//    int numberToTest = 30;
//    GHAssertFalse([self.testSubject isPrime:numberToTest], nil);
//}
//
//- (void)test29IsThe10thPrime {
//    int numberToTest = 29;
//    [self.testSubject isPrime:numberToTest];
//    
//    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
//    
//    GHAssertTrue(calculatedPrimes.count == 10, nil);
//    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
//}
//
//- (void)testHighestKnownPrimeIs29When29IsCalculated {
//    [self.testSubject isPrime:29];
//    
//    GHAssertTrue([self.testSubject highestKnownPrime] == 29, nil);
//}
//
//- (void)test541IsThe100thPrime {
//    int numberToTest = 541;
//    [self.testSubject isPrime:numberToTest];
//    
//    NSArray *calculatedPrimes = [self.testSubject allCalculatedPrimes];
//    
//    GHAssertTrue(calculatedPrimes.count == 100, nil);
//    GHAssertTrue([calculatedPrimes.lastObject intValue] == numberToTest, nil);
//}
//
//- (void)test3571IsThe500thPrime {
//    int numberToTest = 3571;
//    [self.testSubject isPrime:numberToTest];
//    
//    GHAssertTrue([self.testSubject numberOfKnownPrimes] == 500, nil);
//    GHAssertTrue([self.testSubject highestKnownPrime] == numberToTest, nil);
//}
//
//- (void)testCanBeInitializedWithNumberOfPrimesToCalculate {
//    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
//    GHAssertTrue([testSubject numberOfKnownPrimes] == 15, nil);
//}
//
//- (void)testCanAskFor100thPrime {
//    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
//    int hundrethPrime = [testSubject nthPrime:100];
//    GHAssertTrue(hundrethPrime == 541, nil);
//}
//
//- (void)testCanAskFor101stPrime {
//    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:15];
//    int hundredNFirstPrime = [testSubject nthPrime:101];
//    GHAssertTrue(hundredNFirstPrime == 547, nil);
//}
//
//- (void)testCanAskFor0thPrime {
//    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
//    int zerothPrime = [testSubject nthPrime:0];
//    GHAssertTrue(zerothPrime == -1, nil);
//}
//
//- (void)testCanAskForNegativeFirstPrime {
//    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
//    int negOnePrime = [testSubject nthPrime:-1];
//    GHAssertTrue(negOnePrime == -1, nil);
//}
//
//- (void)testCanAskFor10thThen5thThen4thPrime {
//    JHPrimeNumberModel *testSubject = [[JHPrimeNumberModel alloc] initWithNumberOfPrimesToCalculate:2];
//    int tenthPrime = [testSubject nthPrime:10];
//    int fifthPrime = [testSubject nthPrime:5];
//    int fourthPrime = [testSubject nthPrime:4];
//    GHAssertTrue(tenthPrime == 29, nil);
//    GHAssertTrue(fifthPrime == 11, nil);
//    GHAssertTrue(fourthPrime == 7, nil);
//}

@end
