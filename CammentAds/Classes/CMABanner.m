//
// Created by Alexander Fedosov on 19/07/2018.
//

#import "CMABanner.h"


@implementation CMABanner

+ (instancetype)bannerWithUuid:(nullable NSString *)uuid
                   redirectURL:(nullable NSString *)redirectURL
                    timeToShow:(NSTimeInterval)timeToShow
                      imageURL:(nonnull NSString *)imageURL
{
    return [[self alloc] initWithUuid:uuid redirectURL:redirectURL timeToShow:timeToShow imageURL:imageURL];
}

+ (CMABanner *)bannerWithJSONData:(NSDictionary *)jsonDataObject {
    NSString *uuid = jsonDataObject[@"uuid"];
    NSString *imageURL = jsonDataObject[@"imageUrl"];
    NSString *redirectUrl = jsonDataObject[@"redirectUrl"];
    NSNumber *timeToShow = jsonDataObject[@"timeToShow"];

    if (!imageURL) {
        return nil;
    }

    return [CMABanner bannerWithUuid:uuid
                         redirectURL:redirectUrl
                          timeToShow:[timeToShow doubleValue]
                            imageURL:imageURL];
}

- (instancetype)initWithUuid:(nullable NSString *)uuid
                 redirectURL:(nullable NSString *)redirectURL
                  timeToShow:(NSTimeInterval)timeToShow
                    imageURL:(nonnull NSString *)imageURL
{
    self = [super init];
    if (self) {
        self.uuid = uuid;
        self.imageURL = imageURL;
        self.redirectURL = redirectURL;
        self.timeToShow = timeToShow;
    }

    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.uuid=%@", self.uuid];
    [description appendFormat:@", self.imageURL=%@", self.imageURL];
    [description appendFormat:@", self.redirectURL=%@", self.redirectURL];
    [description appendFormat:@", self.timeToShow=%lf", self.timeToShow];
    [description appendString:@">"];
    return description;
}


@end