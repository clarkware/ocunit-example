
@interface TemperatureCalculator : NSObject
{
    id myWeatherLookupService;
}

- (void)setWeatherLookupService:(id)delegate;
- (NSNumber*)boilingPointOfWaterIn:(NSString*)city;

@end