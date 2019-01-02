//
//  RetriveElementsInterface.h
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RetriveElementsInterface

- (void)getElements: (void (^)(NSArray<GalleryItem *>*))completion;

@end
