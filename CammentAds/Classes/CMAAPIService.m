//
// Created by Alexander Fedosov on 19/07/2018.
//

#import "CMAAPIService.h"
#import "AFHTTPSessionManager.h"
#import "CMABanner.h"
#import "CMAShowMetadata.h"
#import "CMAUserIdentity.h"

static NSString *const kCammentAdsAPIDomain = @"https://api.camment.tv";

@implementation CMAAPIService {
    AFHTTPSessionManager *_httpSessionManager;
}

- (instancetype)initWithBaseURL:(nonnull NSString *)baseURL userIdentity:(nonnull CMAUserIdentity *)userIdentity apiKey:(nonnull NSString *)apiKey {
    self = [super init];
    if (self) {
        _userIdentity = userIdentity;
        _httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[[NSURL alloc] initWithString:baseURL ?: kCammentAdsAPIDomain]];

        if (apiKey) {
            [_httpSessionManager.requestSerializer setValue:apiKey forHTTPHeaderField:@"x-api-key"];
        }
    }

    return self;
}

- (void)getPrerollBannerForShowWithMetadata:(CMAShowMetadata *)showMetadata
                                    success:(void (^)(CMABanner *))successBlock
                                    failure:(void (^)(NSError *))failureBlock
{
    NSString *fetchPrerollBannerURLPath = @"/ads";
    NSString *userId = _userIdentity.uuid;
    NSAssert(userId != nil, @"CammentAds: User uuid cannot be nil");

    NSMutableDictionary *requestParameters = [[NSMutableDictionary alloc] initWithDictionary:[showMetadata JSONObject]];
    requestParameters[@"userId"] = userId;

    NSLog(@"request params %@", requestParameters);

    [_httpSessionManager
            GET:fetchPrerollBannerURLPath
     parameters:requestParameters
       progress:^(NSProgress *downloadProgress) {

       }
        success:^(NSURLSessionDataTask *task, id responseObject) {
            if (!successBlock) { return; }

            if (!responseObject || ![responseObject isKindOfClass:[NSDictionary class]]) { successBlock(nil); }

            successBlock([CMABanner bannerWithJSONData:responseObject]);
        }
        failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failureBlock) {
                failureBlock(error);
            }
        }];
}

@end
