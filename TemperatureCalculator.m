#import "TemperatureCalculator.h"
#import "PressureLookup.h"

@implementation TemperatureCalculator

- (void)setWeatherLookupService:(id)delegate
{
    [myWeatherLookupService release];
    myWeatherLookupService = [delegate retain];
}

- (NSNumber*)boilingPointOfWaterIn:(NSString*)city;
{
    double inchesOfMercury = 24.896;
    
    if ([myWeatherLookupService respondsToSelector:@selector(currentPressure:)]) {
        inchesOfMercury = [myWeatherLookupService currentPressure: city];
    } else { 
        [NSException raise:NSInternalInconsistencyException
                    format:@"WeatherLookupService doesn't respond to currentPressure!"];
    }
    
    double boilingPoint = 49.161 * log(inchesOfMercury) + 44.932;
    
    return [NSNumber numberWithDouble: boilingPoint];
}

@end
