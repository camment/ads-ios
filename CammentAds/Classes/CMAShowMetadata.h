//
// Created by Alexander Fedosov on 19/07/2018.
//

#import <Foundation/Foundation.h>


@interface CMAShowMetadata : NSObject

@property (nonatomic, strong, nullable) NSString *uuid;
@property (nonatomic, strong, nullable) NSString *genre;
@property (nonatomic, strong, nullable) NSString *title;
@property (nonatomic, assign) NSInteger length;
@property (nonatomic, assign) BOOL isLive;

@end