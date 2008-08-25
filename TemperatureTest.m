#import "TemperatureTest.h"
#import "TemperatureCalculator.h"

@implementation TemperatureTest

- (void) setUp
{
    transformer = [[CentigradeValueTransformer alloc] init];
}

- (void) tearDown
{
    [transformer release];
}

- (void) testCentigradeFreezingPoint
{
    
    NSString *kelvinFreezingPoint = @"273";
    
    NSNumber *centigradeFreezingPoint =
        [transformer transformedValue:kelvinFreezingPoint];
    
    STAssertEquals(0, [centigradeFreezingPoint intValue],
                   @"Centigrade freezing point should be 0, it was %d instead!", 
                   [centigradeFreezingPoint intValue]);
}

- (void) testKelvinFreezingPoint
{
    
    NSString *centrigradeFreezingPoint = @"0";
        
    NSNumber *kelvinFreezingPoint =
        [transformer reverseTransformedValue:centrigradeFreezingPoint];
    
    STAssertEqualObjects([NSNumber numberWithInt:273], 
                         [NSNumber numberWithInt:[kelvinFreezingPoint intValue]], 
                         nil);
}

- (void) testCentigradeFreezingPointWithString
{
    NSString *kelvinFreezingPoint = @"273";
    
    NSNumber *centigradeFreezingPoint =
        [transformer transformedValue:kelvinFreezingPoint];
    
    STAssertEquals(0, [centigradeFreezingPoint intValue], nil);
}

- (void) testBadValueThrowsException
{
    NSObject *badValue = [[NSObject alloc] init];
    
    STAssertThrows([transformer transformedValue:badValue], nil);
}

- (void) testBoilingPointOfWaterInDenver
{
    TemperatureCalculator *calculator = 
        [[TemperatureCalculator alloc] init];
    
    [calculator setWeatherLookupService: self];
    
    NSNumber *boilingPoint =
        [calculator boilingPointOfWaterIn: @"Denver"];
    
    STAssertEquals(202, [boilingPoint intValue], 
                   @"Boiling point should be 202, but was %d instead!", 
                   [boilingPoint intValue]);
    
    [calculator release];
}

- (double)currentPressure:(NSString*)city {
    
    return 24.896;
}


- (void) testSuite {
    
    SenTestSuite *suite = [SenTestSuite testSuiteWithName: @"My Tests"];

    [suite addTest: [TemperatureTest testCaseWithSelector:@selector(testCentigradeFreezingPoint)]];
    SenTestSuite *anotherSuite= 
        [SenTestSuite testSuiteForTestCaseClass:[TemperatureTest class]];
    [suite addTest: anotherSuite];
    [suite addTest: [[TemperatureTest alloc] init]];
     
    STAssertNotNil(suite, nil);
}

@end