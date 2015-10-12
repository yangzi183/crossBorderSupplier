//
//  CategoryViewController.m
//  crossShop
//
//  Created by mac on 15/8/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CategoryViewController.h"
#import "TopicMode3SecondCell.h"
#import "CategoryGoods.h"


static NSString *topicMode3SecondCell = @"topicMode3SecondCell";

@interface CategoryViewController () {
    NSArray *flowTableData;
    NSArray *goodsArray;
}

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"\r\n type:%d", self.categoryViewType);
    CGFloat width = self.view.frame.size.width;
    self.categoryFlow.backgroundColor = [UIColor clearColor];
    [self.categoryFlow configFlowTable:width];
    [self initData];
    UINib *secondCell = [UINib nibWithNibName:@"TopicMode3SecondCell" bundle:nil];
    [self.collectionView registerNib:secondCell forCellWithReuseIdentifier:topicMode3SecondCell];
    self.collectionView.backgroundColor = [UIColor clearColor];
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(updateGoods:) name:kNOTIFICATION_INFO_CATEGORY_VIEW_CHANGE object:nil];
    goodsArray = [NSArray arrayWithObjects:@"test1", @"test1", @"test1", @"test1", @"test1", @"test1", @"test1", @"test1",nil];
    switch (self.categoryViewType) {
        case CATEGORY_DIAPER:
            self.navigationItem.title = @"纸尿裤";
            break;
        case CATEGORY_FOOD:
            self.navigationItem.title = @"辅食";
            break;
        case CATEGORY_MILK:
            self.navigationItem.title = @"奶粉";
            break;
        default:
            break;
    }
    ShoppingCartItem *shopItem = [[ShoppingCartItem alloc] initWithFrame:CGRectMake(0, 0, kSHOPPING_CART_ITEM_WIDTH, kSHOPPING_CART_ITEM_HEIGHT)];
    shopItem.delegate = self;
    shopItem.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *shopRightItem = [[UIBarButtonItem alloc] initWithCustomView:shopItem];
    self.navigationItem.rightBarButtonItem = shopRightItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData {
    flowTableData = [CategoryGoods getBrandsByCategory:self.categoryViewType];
    //flowTableData = [NSMutableArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
    [self.categoryFlow setDataArray:flowTableData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return goodsArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize returnSize = CGSizeMake((self.collectionView.frame.size.width) / 2, 230);
    return returnSize;
}

/*- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets edg = UIEdgeInsetsMake(0, 0, 0, 0);
    return edg;
}*/

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //self.collectionView.backgroundColor = [UIColor whiteColor];
    TopicMode3SecondCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topicMode3SecondCell forIndexPath:indexPath];
    cell.backgroundColor = [CROCommonAPI colorWithHexString:@"f5f6f6"];
    [cell setConstraintByIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showGoodsDetailView" sender:nil];
}

- (void)updateGoods: (NSNotification *)sender {
    NSNumber *tagNumber = (NSNumber *)[sender object];
    goodsArray = [CategoryGoods getGoodsByBrandId:[tagNumber integerValue]];
    [self.collectionView reloadData];
    //NSLog(@"\r\n tagnuber:%ld", [tagNumber integerValue]);
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)tapShoppingCartView {
    [self performSegueWithIdentifier:@"showShoppingCartView" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
