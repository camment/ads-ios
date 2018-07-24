//
// Created by Alexander Fedosov on 23/07/2018.
//

#import <Foundation/Foundation.h>


static NSString *const kCammentAdsUserIdKey = @"kCammentAdsUserId";

static NSString *const kCammentAdsUserIdHasChangedNotification = @"kCammentAdsUserIdHasChangedNotification";

@interface CMAUserIdentity : NSObject

@property (nonnull, nonatomic, strong, readonly) NSString *uuid;

- (instancetype)initWithUuid:(NSString *)uuid;

@end