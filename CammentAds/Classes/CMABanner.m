//
// Created by Alexander Fedosov on 19/07/2018.
//

#import "CMABanner.h"


@implementation CMABanner

- (instancetype)initWithImageURL:(nonnull NSString *)imageURL
                     redirectURL:(nullable NSString *)redirectURL
                      timeToShow:(NSTimeInterval *)timeToShow
{
    self = [super init];
    if (self) {
        self.imageURL = imageURL;
        self.redirectURL = redirectURL;
        self.timeToShow = timeToShow;
    }

    return self;
}

+ (instancetype)bannerWithImageURL:(nonnull NSString *)imageURL
                       redirectURL:(nullable NSString *)redirectURL
                        timeToShow:(NSTimeInterval *)timeToShow
{
    return [[self alloc] initWithImageURL:imageURL redirectURL:redirectURL timeToShow:timeToShow];
}

@end