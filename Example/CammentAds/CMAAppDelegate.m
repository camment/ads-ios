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
    [[CMACammentAds sharedInstance] configureWithBaseURL:@"https://dev-api.camment.tv"
                                                  apiKey:@"iYeooUSdMZ8FOBMZeL2zb9YDLdW0uvbVlitykh7d"];

    return YES;
}

@end
