//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>
#import "CMABannersServiceInterface.h"

@class CMAUserIdentity;

@interface CMAAPIService : NSObject <CMABannersServiceInterface>

@property (nonatomic, weak, readonly) CMAUserIdentity *userIdentity;

- (instancetype)initWithBaseURL:(nonnull NSString *)baseURL
                   userIdentity:(nonnull CMAUserIdentity *)userIdentity
                         apiKey:(nonnull NSString *)apiKey;

@end