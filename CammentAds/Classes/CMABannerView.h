//
// Created by Alexander Fedosov on 23/07/2018.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CMABanner;

@interface CMABannerView: UIView

@property (nonnull, nonatomic, strong, readonly) CMABanner *banner;

- (instancetype)initWithBanner:(CMABanner *)banner bannerDeletionBlock:(void (^)(void))bannerDeletionBlock;

@end
