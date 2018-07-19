//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>


@interface CMABanner : NSObject

@property (nonatomic, strong, nonnull) NSString *imageURL;
@property (nonatomic, strong, nullable) NSString *redirectURL;
@property (nonatomic, assign) NSTimeInterval *timeToShow;

- (instancetype)initWithImageURL:(nonnull NSString *)imageURL
                     redirectURL:(nullable NSString *)redirectURL
                      timeToShow:(NSTimeInterval *)timeToShow;

+ (instancetype)bannerWithImageURL:(nonnull NSString *)imageURL
                       redirectURL:(nullable NSString *)redirectURL
                        timeToShow:(NSTimeInterval *)timeToShow;

@end