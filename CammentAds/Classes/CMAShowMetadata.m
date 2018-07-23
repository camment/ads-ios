//
// Created by Alexander Fedosov on 19/07/2018.
//

#import "CMAShowMetadata.h"


@implementation CMAShowMetadata {

}
- (NSDictionary *)JSONObject {
    NSMutableDictionary *jsonData = [NSMutableDictionary new];

    if (_uuid) { jsonData[@"uuid"] = _uuid; }
    if (_genre) { jsonData[@"genre"] = _genre; }
    if (_title) { jsonData[@"title"] = _title; }
    if (_length != 0) { jsonData[@"length"] = @(_length); }
    jsonData[@"isLive"] = @(_isLive);

    return jsonData;
}
@end