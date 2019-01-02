//
//  UrlManager.m
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import "UrlManager.h"

@implementation UrlManager

static NSString * const apiKey = @"51885ef41dff54033e1de374307f110c";
static NSString * const prefSearchQuery = @"searchQuery";

static NSString * const endPoint = @"https://api.flickr.com/services/rest/";
static NSString * const methodGetRecent = @"https://api.flickr.com/services/rest/";
static NSString * const methodSearch = @"flickr.photos.search";

+ (NSString *)getItemUrl:(NSString *)query page:(NSNumber *)page {
    NSString* url;
    
    if (query != nil) {
        url = [NSString stringWithFormat:@"%@?method=%@&api_key=%@&format=json&nojsoncallback=1&text=%@&page=%@", endPoint, methodSearch, apiKey, &query, &page];
    } else {
        url = [NSString stringWithFormat:@"%@?method=%@&api_key=%@&format=json&nojsoncallback=1&page=%@", endPoint, methodGetRecent, apiKey, page];
    }
    
    return url;
}

@end
