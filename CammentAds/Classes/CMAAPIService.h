//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>
#import "CMABannersServiceInterface.h"


@interface CMAAPIService : NSObject <CMABannersServiceInterface>

@property (nonatomic, strong, readonly, nonnull) NSString *apiKey;

- (instancetype)initWithApiKey:(nonnull NSString *)apiKey;

+ (instancetype)serviceWithApiKey:(nonnull NSString *)apiKey;

@end