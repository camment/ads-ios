//
// Created by Camment OY on 19/07/2018.
//

#import "CMACammentAds.h"
#import "CMAAPIService.h"
#import "CMAShowMetadata.h"
#import "CMABanner.h"
#import "CMAUserIdentity.h"

@interface CMACammentAds()

@property (nonatomic, strong) CMAAPIService *apiService;
@property (nonatomic, strong) CMAUserIdentity *userIdentity;

@end

@implementation CMACammentAds

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.userIdentity = [CMAUserIdentity new];
    }

    return self;
}

- (void)configureWithBaseURL:(nullable NSString *)baseURL apiKey:(nonnull NSString *)apiKey {
    self.apiService = [[CMAAPIService alloc] initWithBaseURL:baseURL
                                                userIdentity:_userIdentity
                                                      apiKey:apiKey];
}

- (void)configureWithApiKey:(nonnull NSString *)apiKey {
    [self configureWithBaseURL:nil apiKey:apiKey];
}

- (void)getPrerollBannerForShowWithMetadata:(CMAShowMetadata *)showMetadata
                                    success:(void(^)(CMABanner *))successBlock
                                    failure:(void(^)(NSError *))failureBlock
{
    if (!_apiService && failureBlock) {
        NSError *error = [NSError errorWithDomain:kCammentAdsErrorDomain
                                                  code:kCammentAdsErrorNotConfigured
                                         userInfo:@{
            NSLocalizedDescriptionKey: NSLocalizedString(@"API Service can not be nil. Did you forget to configure SDK with an API key?", nil),
            NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Configure SDK with provided API key", nil),
            NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"API service is nil", nil)
        }];

        failureBlock(error);
        return;
    }

    [_apiService getPrerollBannerForShowWithMetadata:showMetadata
                                             success:successBlock
                                             failure:failureBlock];
}

@end