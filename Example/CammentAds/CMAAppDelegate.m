//
//  CMAAppDelegate.m
//  CammentAds
//
//  Created by Camment OY on 07/19/2018.
//  Copyright (c) 2018 Camment OY. All rights reserved.
//

#import "CMAAppDelegate.h"
#import <CammentAds/CMACammentAds.h>

@implementation CMAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[CMACammentAds sharedInstance] configureWithApiKey:@""];

    return YES;
}

@end
