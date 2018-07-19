//
// Created by Camment OY on 19/07/2018.
//

#import <Foundation/Foundation.h>
#import "CMABannersServiceInterface.h"


static NSString *const kCammentAdsErrorDomain = @"tv.camment.ads";
static const int kCammentAdsErrorNotConfigured = -400;

@interface CMACammentAds: NSObject<CMABannersServiceInterface>

+ (instancetype)sharedInstance;

- (void)configureWithApiKey:(nonnull NSString *)apiKey;

@end