//
//  ViewController.m
//  FlickrPhotoGalleryOC
//
//  Created by Gianmarco Cotellessa on 02/01/2019.
//  Copyright © 2019 Gianmarco Cotellessa. All rights reserved.
//

#import "ViewController.h"
#import "NetworkClient.h"
#import "CollectionViewCell.h"
#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController
{
    UISearchController *searchController;
    NSArray<GalleryItem *> *items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    items = [[NSArray<GalleryItem *> alloc] init];
    
    [self setupNavBar];
    [self setupCollectionView];
    [self startLoading:nil];
}

- (void)setupNavBar {
    self.navigationItem.searchController = searchController;
    self.navigationItem.hidesSearchBarWhenScrolling = true;
    searchController.searchBar.delegate = self;
}

- (void)setupCollectionView {
    CGFloat itemSize = [[UIScreen mainScreen] bounds].size.width/3 - 1;
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout alloc];
    
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.itemSize = CGSizeMake(itemSize, itemSize);
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    
    _collectionView.collectionViewLayout = layout;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return items.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[items[indexPath.row] getUrl]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailViewController *descVc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    descVc.url = items[indexPath.row].getUrl;
    [self.navigationController pushViewController:descVc animated:true];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText == nil || [searchText  isEqual: @""]) {
        [self.view endEditing:true];
        [[self collectionView] reloadData];
    } else {
        [self startLoading:searchText];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchController.searchBar endEditing:true];
    [self.view endEditing:true];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [searchController.searchBar endEditing:true];
}

- (void) startLoading: (NSString *) query {
    
    NetworkClient *result = [[NetworkClient alloc] initWithQuery:query page: [NSNumber numberWithInt:1]];
    
    [result getElements:^(NSArray<GalleryItem *> *elements) {
        self->items = elements;
        [[self collectionView] reloadData];
    }];
}

@end
