//
//  DetailViewController.m
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 05/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    [_imgView sd_setImageWithURL:_url];
}

@end
