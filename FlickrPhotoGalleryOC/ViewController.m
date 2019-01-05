//
//  ViewController.m
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import "ViewController.h"
#import "NetworkClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NetworkClient *result = [[NetworkClient alloc] initWithQuery:@"cane" page: [NSNumber numberWithInt:1]];
    
    [result getElements:^(NSArray<GalleryItem *> *elements) {
        NSLog(@"%@", elements);
    }];
}


@end
