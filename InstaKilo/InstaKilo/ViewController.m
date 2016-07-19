//
//  ViewController.m
//  InstaKilo
//
//  Created by Mark Meritt on 2016-07-15.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "PhotoDataSource.h"
#import "SectionHeaderView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

static NSString * const reuseIdentifier = @"PhotoCell";
PhotoDataSource *data;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     data = [[PhotoDataSource alloc] init];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    int width = CGRectGetWidth(self.collectionView.frame) / 3;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return [data numberOfSections];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items

    int num = 0;
    
    if(section == 0)
       num = [data findKeys:0];
    if(section == 1)
       num = [data findKeys:1];
    if(section == 2)
       num = [data findKeys:2];
    if(section == 3)
       num = [data findKeys:3];
    if(section == 4)
       num = [data findKeys:4];
    if(section == 5)
       num = [data findKeys:5];
    if(section == 6)
       num = [data findKeys:6];
    
    
    
    return num;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
        cell.imgView.image = [data.imageArray objectAtIndex:indexPath.row];
    
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    SectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SectionHead" forIndexPath:indexPath];
    
    header.titleLbl.text = [data.uniqueVals objectAtIndex:indexPath.section];
    header.backgroundColor = [UIColor whiteColor];
    
    return header;
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
