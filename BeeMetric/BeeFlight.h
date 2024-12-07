//
//  BeeFlight.h
//  BeeMetric
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeeFlight : NSObject

- (void)beeFlightTrajectoriesUsingSpatialAndTemporalDataModels:(NSString *)models;
- (BOOL)foragingFlightPatternsInRelationToNectarSourceDistribution;

@end

NS_ASSUME_NONNULL_END
