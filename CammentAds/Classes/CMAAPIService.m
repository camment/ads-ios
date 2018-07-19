//
// Created by Alexander Fedosov on 19/07/2018.
//

#import "CMAAPIService.h"


@implementation CMAAPIService

- (instancetype)initWithApiKey:(nonnull NSString *)apiKey {
    self = [super init];
    if (self) {
        _apiKey = apiKey;
    }

    return self;
}

+ (instancetype)serviceWithApiKey:(nonnull NSString *)apiKey {
    return [[self alloc] initWithApiKey:apiKey];
}

- (void)getPrerollBannerForShowWithMetadata:(CMAShowMetadata *)showMetadata
                                    success:(void (^)(CMABanner *))successBlock
                                    failure:(void (^)(NSError *))failureBlock
{
#warning Not impelented!
}

@end
