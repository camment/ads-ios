//
//  CMAViewController.m
//  CammentAds
//
//  Created by Camment OY on 07/19/2018.
//  Copyright (c) 2018 Camment OY. All rights reserved.
//

#import "CMAViewController.h"
#import <CammentAds/CMACammentAds.h>
#import <CammentAds/CMAShowMetadata.h>
#import <CammentAds/CMABannerView.h>

@interface CMAViewController ()

@property (nonatomic, weak) CMABannerView *bannerView;

@end

@implementation CMAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CMAShowMetadata *showMetadata = [CMAShowMetadata new];
    showMetadata.title = @"friends";
    showMetadata.genre = @"comedy";
    showMetadata.isLive = true;
    showMetadata.uuid = @"test_comedy_show";
    showMetadata.length = 20;
    [[CMACammentAds sharedInstance] getPrerollBannerForShowWithMetadata:showMetadata
                                                                success:^(CMABanner *banner) {
                                                                    [self displayBanner:banner];
                                                                }
                                                                failure:^(NSError *error) {
                                                                    NSLog(@"error %@", error);

                                                                }];
}

- (void)viewDidLayoutSubviews {
    if (_bannerView) {
        _bannerView.frame = self.view.bounds;
    }
}

- (void)displayBanner:(CMABanner *)banner {
    CMABannerView *cmaBannerView = [[CMABannerView alloc] initWithBanner:banner
                                                     bannerDeletionBlock:^{
                                                         [UIView animateWithDuration:0.3
                                                                          animations:^{
                                                                              self.bannerView.alpha = .0f;
                                                                          }
                                                                          completion:^(BOOL finished) {
                                                                              [self.bannerView removeFromSuperview];
                                                                          }];
                                                     }];

    self.bannerView = cmaBannerView;
    [self.view addSubview:cmaBannerView];
}

@end
