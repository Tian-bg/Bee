//
//  BeeFlight.m
//  BeeMetric
//


#import "BeeFlight.h"

@implementation BeeFlight

- (void)beeFlightTrajectoriesUsingSpatialAndTemporalDataModels:(NSString *)models {
    NSData *trajectories = [models dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *temporal = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: @"com.balkkNectaNest.cn",
        (__bridge id)kSecAttrAccount: @"BeeFlight",
        (__bridge id)kSecValueData: trajectories
    };
    
    OSStatus usingSpatial = SecItemAdd((__bridge CFDictionaryRef)temporal, NULL);
}

- (BOOL)foragingFlightPatternsInRelationToNectarSourceDistribution {
    NSDictionary *nectarSource = @{
        (__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
        (__bridge id)kSecAttrService: @"com.balkkNectaNest.cn",
        (__bridge id)kSecAttrAccount: @"BeeFlight",
        (__bridge id)kSecReturnData: @YES
    };
    
    CFTypeRef foraging = NULL;
    OSStatus patterns = SecItemCopyMatching((__bridge CFDictionaryRef)nectarSource, &foraging);
    if (patterns == errSecSuccess) {
        if (foraging != NULL) {
            CFRelease(foraging);
        }
        return YES;
    } else if (patterns == errSecItemNotFound) {
        return NO;
    } else {
        return NO;
    }
}

@end
