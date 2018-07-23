//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>


@interface CMABanner : NSObject

@property (nonatomic, strong, nonnull) NSString *uuid;
@property (nonatomic, strong, nonnull) NSString *imageURL;
@property (nonatomic, strong, nullable) NSString *redirectURL;
@property (nonatomic, assign) NSTimeInterval timeToShow;

- (instancetype)initWithUuid:(nullable NSString *)uuid redirectURL:(nullable NSString *)redirectURL timeToShow:(NSTimeInterval)timeToShow imageURL:(nonnull NSString *)imageURL;

- (NSString *)description;

+ (instancetype)bannerWithUuid:(nullable NSString *)uuid redirectURL:(nullable NSString *)redirectURL timeToShow:(NSTimeInterval)timeToShow imageURL:(nonnull NSString *)imageURL;

+ (CMABanner *)bannerWithJSONData:(NSDictionary *)jsonDataObject;

@end