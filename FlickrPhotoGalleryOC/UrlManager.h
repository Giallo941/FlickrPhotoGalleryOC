//
//  UrlManager.h
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlManager : NSObject

+ (NSString *)getItemUrl: (NSString *)query page:(NSNumber *)page;

@end
