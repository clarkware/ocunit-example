/*
    RankineValueTransformer.h
    Copyright (c) 2003, Apple Computer, Inc., all rights reserved.
    Author: Bill Bumgarner

    Converts Kelvin units to Rankine units.  Supports reverse
    transformations. 
*/

@interface RankineValueTransformer : NSValueTransformer
+ (Class)transformedValueClass;
+ (BOOL)allowsReverseTransformation;

- (id)transformedValue:(id)value;
- (id)reverseTransformedValue:(id)value;
@end
