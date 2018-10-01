//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>


@interface CMABanner : NSObject

@property (nonatomic, strong, nonnull) NSString *uuid;
@property (nonatomic, strong, nonnull) NSString *prerollAssetUrl;
@property (nonatomic, strong, nullable) NSString *redirectURL;
@property (nonatomic, assign) NSTimeInterval prerollDuration;

+ (instancetype)bannerWithUuid:(nullable NSString *)uuid
                   redirectURL:(nullable NSString *)redirectURL
                    prerollDuration:(NSTimeInterval)prerollDuration
                      prerollAssetUrl:(nonnull NSString *)prerollAssetUrl;

+ (CMABanner *)bannerWithJSONData:(NSDictionary *)jsonDataObject;

- (instancetype)initWithUuid:(nullable NSString *)uuid
                 redirectURL:(nullable NSString *)redirectURL
                  prerollDuration:(NSTimeInterval)prerollDuration
                    prerollAssetUrl:(nonnull NSString *)prerollAssetUrl;

@end
