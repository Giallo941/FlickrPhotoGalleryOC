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
}

- (void)getElements:(void (^)(NSArray *))completion {
    NSString * urlString = [UrlManager getItemUrl: _query page: _page];
    
    NSURL * url = [NSURL URLWithString: urlString];
    if (url == nil) {
        
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    return;
                                                } else {
                                                    NSDictionary *json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    NSLog(@"%@",json);
                                                }
                    
                                            }];
    [dataTask resume];
    
}

@end
