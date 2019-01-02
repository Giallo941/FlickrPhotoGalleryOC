//
//  GalleryItem.m
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GalleryItem.h"

@implementation GalleryItem

- (instancetype)initWithId:(NSString *)pId secret:(NSString *)secret server:(NSString *)server
                farm:(NSString *)farm {
    self.pId = pId;
    self.secret = secret;
    self.server = server;
    self.farm = farm;
    
    return self;
}

- (NSString *)getId {
    return _pId;
}

- (NSURL *)getUrl {
    return [NSURL URLWithString:([NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@.jpg", _farm, _server, _pId, _secret])];
}

@end
