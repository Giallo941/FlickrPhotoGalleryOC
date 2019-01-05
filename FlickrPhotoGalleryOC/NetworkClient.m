//
//  NetworkClient.m
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkClient.h"
#import "RetriveElementsInterface.h"
#import "UrlManager.h"

@implementation NetworkClient

- (instancetype)initWithQuery:(NSString *)query page:(NSNumber *)page {
    self.query = query;
    self.page = page;
    return self;
}

- (void)getElements:(void (^)(NSArray<GalleryItem *> *))completion {
    NSString * urlString = [UrlManager getItemUrl: _query page: _page];
    
    NSURL * url = [NSURL URLWithString: urlString];
    if (url == nil) {
        completion([NSMutableArray<GalleryItem *> new]);
        return;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error && data != nil) { return; }

                                                @try {
                                                     NSDictionary<NSString *, id> *resultDictionary  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    
                                                    NSDictionary *photosContainer = [resultDictionary objectForKey:@"photos"];
                                                    NSArray<NSDictionary *> *photosArray = [photosContainer objectForKey:@"photo"];
                                                    
                                                    NSMutableArray<GalleryItem *> *galleryItems = [NSMutableArray<GalleryItem *> new];
                                                    
                                                    for (NSDictionary * photoDictionary in photosArray) {
                                                        
                                                        NSString *pid = [photoDictionary objectForKey:@"id"];
                                                        NSString *secret = [photoDictionary objectForKey:@"secret"];
                                                        NSString *server = [photoDictionary objectForKey:@"server"];
                                                        NSNumber *farm = [photoDictionary objectForKey:@"farm"];
                                                        
                                                        GalleryItem *galleryItem = [[GalleryItem alloc] initWithId:pid secret:secret server:server farm:farm];
                                                        
                                                        [galleryItems addObject: galleryItem];
                                                    }
                                                   
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        completion(galleryItems);
                                                    });
                                                    
                                                } @catch (NSException *exception) {
                                                    NSLog(@"error parsing json: %@", exception);
                                                    return;
                                                }
                                                
                                            }];
    [dataTask resume];
    
}

@end
