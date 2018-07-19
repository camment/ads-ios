//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>

@class CMAShowMetadata, CMABanner;

@protocol CMABannersServiceInterface <NSObject>

- (void)getPrerollBannerForShowWithMetadata:(CMAShowMetadata *)showMetadata
                                    success:(void(^)(CMABanner *))successBlock
                                    failure:(void(^)(NSError *))failureBlock;

@end