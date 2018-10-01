//
// Created by Alexander Fedosov on 19/07/2018.
//

#import "CMABanner.h"


@implementation CMABanner

+ (instancetype)bannerWithUuid:(nullable NSString *)uuid
                   redirectURL:(nullable NSString *)redirectURL
                    prerollDuration:(NSTimeInterval)prerollDuration
                      prerollAssetUrl:(nonnull NSString *)prerollAssetUrl
{
    return [[self alloc] initWithUuid:uuid
                          redirectURL:redirectURL
                      prerollDuration:prerollDuration
                      prerollAssetUrl:prerollAssetUrl];
}

+ (CMABanner *)bannerWithJSONData:(NSDictionary *)jsonDataObject {
    NSString *uuid = jsonDataObject[@"uuid"];
    NSString *prerollAssetUrl = jsonDataObject[@"prerollAssetUrl"];
    NSString *redirectUrl = jsonDataObject[@"redirectUrl"];
    NSNumber *prerollDuration = jsonDataObject[@"prerollDuration"];

    if (!prerollAssetUrl) {
        return nil;
    }

    return [CMABanner bannerWithUuid:uuid
                         redirectURL:redirectUrl
                          prerollDuration:[prerollDuration doubleValue]
                            prerollAssetUrl:prerollAssetUrl];
}

- (instancetype)initWithUuid:(nullable NSString *)uuid
                 redirectURL:(nullable NSString *)redirectURL
                  prerollDuration:(NSTimeInterval)prerollDuration
                    prerollAssetUrl:(nonnull NSString *)prerollAssetUrl
{
    self = [super init];
    if (self) {
        self.uuid = uuid;
        self.prerollAssetUrl = prerollAssetUrl;
        self.redirectURL = redirectURL;
        self.prerollDuration = prerollDuration;
    }

    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"  self.uuid=%@", self.uuid];
    [description appendFormat:@", self.prerollAssetUrl=%@", self.prerollAssetUrl];
    [description appendFormat:@", self.redirectURL=%@", self.redirectURL];
    [description appendFormat:@", self.prerollDuration=%lf", self.prerollDuration];
    [description appendString:@">"];
    return description;
}


@end
