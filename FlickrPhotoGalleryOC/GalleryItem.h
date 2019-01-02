//
//  GalleryItem.h
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleryItem : NSObject

@property NSString *pId;
@property NSString *secret;
@property NSString *server;
@property NSString *farm;

- (instancetype)initWithId:(NSString *)pId
                    secret:(NSString *)secret
                    server:(NSString *)server
                      farm:(NSString *)farm;

- (NSString *)getId;

- (NSURL *)getUrl;

@end
