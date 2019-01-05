//
//  NetworkClient.h
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GalleryItem.h"

@interface NetworkClient: NSObject

@property NSString *query;
@property NSNumber *page;

- (instancetype)initWithQuery:(NSString *)query
                         page:(NSNumber *)page;

- (void)getElements: (void (^)(NSArray<GalleryItem *>*))completion;

@end
