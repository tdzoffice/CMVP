//
//  ViewController.m
//  CMVP
//
//  Created by MAC on 29/02/2024.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Register ShopListCVC as the cell for collection view
    [self.shopListCollectionView registerNib:[UINib nibWithNibName:@"ShopListCVC" bundle:nil] forCellWithReuseIdentifier:@"ShopListCVC"];
    
    // Set data source, delegate, and flow layout delegate
    self.shopListCollectionView.dataSource = self;
    self.shopListCollectionView.delegate = self;
    self.shopListCollectionView.collectionViewLayout = [self collectionViewFlowLayout];
}

- (UICollectionViewFlowLayout *)collectionViewFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    // Adjust item size to fit one cell per row
    flowLayout.itemSize = CGSizeMake(self.shopListCollectionView.frame.size.width, 95);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0;
    return flowLayout;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // Return the number of items in your collection view
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // Dequeue reusable cell and cast it to ShopListCVC
    ShopListCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ShopListCVC" forIndexPath:indexPath];
    
    // Configure the cell with your data
    // For example:
    // cell.cellName.text = /* your cell name */;
    // cell.cellDesc.text = /* your cell description */;
    
    return cell;
}

@end

