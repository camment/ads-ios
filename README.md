# CammentAds for iOS

To get started with the CammentAds for iOS you can use the existing demo application project, or you can use the library in your existing project.

## Technical requirements
- Xcode 7 or later
- iOS 8.1 or later
- Cocoapods

## Add CammentAds to your project

Open yout Podfile and add `pod 'CammentAds'` there

```ruby
platform :ios, '8.1'

target 'Your target' do
    pod 'CammentAds'
end
```
then run `pod install`

## Configuring CammentAds

Open your `AppDelegate` file and configure sdk with an api key
```objc
// import SDK
#import <CammentAds/CMACammentAds.h>

...    

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[CMACammentAds sharedInstance] configureWithApiKey:@"YOUR_API_KEY"];

    return YES;
}

```

## Retrieving CammentAd Banner

```objc
//Create CMAShowMetadata object and set CMAShowMetadata fields according to your current video show to get more relevant banner
CMAShowMetadata *showMetadata = [CMAShowMetadata new];
showMetadata.title = @"friends";
showMetadata.genre = @"comedy";
showMetadata.isLive = true;
showMetadata.uuid = @"test_comedy_show";
showMetadata.length = 20;

//time to retrieve a banner!
[[CMACammentAds sharedInstance] getPrerollBannerForShowWithMetadata:showMetadata
                                                            success:^(CMABanner *banner) {
                                                                // now you'ready to show the banner
                                                                [self displayBanner:banner];
                                                            }
                                                            failure:^(NSError *error) {
                                                                NSLog(@"error %@", error);

                                                            }];
```

## Adding BannerView into your layout
1. Add a property to keep reference to the bannerView to your view controller

```objc
@interface CMAViewController ()

@property (nonatomic, weak) CMABannerView *bannerView;

@end
```

2. Make sure you set a correct layout the banner

```obj
- (void)viewDidLayoutSubviews {
    if (_bannerView) {
        _bannerView.frame = self.view.bounds;
    }
}
```

3. Show the banner with BannerView

```objc
- (void)displayBanner:(CMABanner *)banner {
    if (!banner) { return; }
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
```

Take a look at `bannerDeletionBlock` - it should contain the code that removes banner from viewcontroller but having animations there is not required 
