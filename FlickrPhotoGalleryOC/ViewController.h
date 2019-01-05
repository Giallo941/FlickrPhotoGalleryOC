//
//  ViewController.h
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

- (void) startLoading: (NSString *) query;

@end

