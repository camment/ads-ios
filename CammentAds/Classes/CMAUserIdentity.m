//
// Created by Alexander Fedosov on 23/07/2018.
//

#import "CMAUserIdentity.h"


@implementation CMAUserIdentity

- (instancetype)init {
    return [self initWithUuid:[[NSUserDefaults standardUserDefaults] valueForKey:kCammentAdsUserIdKey]];
}

- (instancetype)initWithUuid:(NSString *)uuid {
    self = [super init];
    if (self) {

        if (!uuid) {
            _uuid = [self generateNewIdentity];
        } else {
            _uuid = uuid;
        }

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(userIdHasChanged:)
                                                     name:kCammentAdsUserIdHasChangedNotification
                                                   object:nil];
    }

    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
};

- (void)userIdHasChanged:(NSNotification *)aNotification {
    NSString *uuid = [aNotification.userInfo valueForKey:@"uuid"];
    if (!uuid) { return; }
    _uuid = uuid;
}

- (NSString *)generateNewIdentity {
    NSString *uuid = [[[NSUUID new] UUIDString] lowercaseString];
    [[NSUserDefaults standardUserDefaults] setValue:uuid forKey:kCammentAdsUserIdKey];
    return uuid;
}

@end