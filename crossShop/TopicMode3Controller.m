//
//  TopicMode3Controller.m
//  crossShop
//
//  Created by mac on 15/6/15.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TopicMode3Controller.h"
#import "UILabel+textFrame.h"
#import "TopicMode3SectionView.h"
#import "CROCommonAPI.h"

static NSString *topicMode3HeadCell = @"topicMode3HeadCell";
static NSString *topicMode3FirstCell = @"topicMode3FirstCell";
static NSString *topicMode3SecondCell = @"topicMode3SecondCell";
static NSString *reuseableCell = @"topicMode3Section";

@interface TopicMode3Controller ()

@end

@implementation TopicMode3Controller

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UINib *headCell = [UINib nibWithNibName:@"TopicMode3HeadCell" bundle:nil];
    UINib *firstCell = [UINib nibWithNibName:@"TopicMode3FirstCell" bundle:nil];
    UINib *secondCell = [UINib nibWithNibName:@"TopicMode3SecondCell" bundle:nil];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:headCell forCellWithReuseIdentifier:topicMode3HeadCell];
    [self.collectionView registerNib:firstCell forCellWithReuseIdentifier:topicMode3FirstCell];
    [self.collectionView registerNib:secondCell forCellWithReuseIdentifier:topicMode3SecondCell];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UILabel *label = [[UILabel alloc]init];
    [label boundingRectWithSize:CGSizeMake(self.collectionView.frame.size.width, 0)];
    
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    TopicMode3SectionView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseableCell forIndexPath:indexPath];
    
    headView.backgroundColor = [UIColor clearColor];
    if (indexPath.section == 0) {
        NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
        [dicData setValue:@"关于全民阅读2" forKey:@"title"];
        [dicData setValue:@"about_icon" forKey:@"image"];
        [headView setSectionHeadInfo:dicData];
    } else {
        NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
        [dicData setValue:@"相关专题" forKey:@"title"];
        [dicData setValue:@"album_icon" forKey:@"image"];
        [headView setSectionHeadInfo:dicData];
        headView.backgroundColor = [CROCommonAPI colorWithHexString:@"e8e8e8"];
    }
    return headView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UILabel *strLabel = [UILabel new];
        NSString *str = @"日落时分，沏上一杯山茶，听一曲意境空远的《禅》，心神随此天籁，沉溺于玄妙的幻境里。仿佛我就是那穿梭于葳蕤山林中的一只飞鸟，时而盘旋穿梭，时而引吭高歌；仿佛我就是那潺潺流泻于山涧的一汪清泉，涟漪轻盈，浩淼长流；仿佛我就是那竦峙在天地间的一座山峦，伟岸高耸，从容绵延。我不相信佛，只是喜欢玄冥空灵的梵音经贝，与慈悲淡然的佛境禅心，在清欢中，从容幽静，自在安然。一直向往走进青的山，碧的水，体悟山水的绚丽多姿，领略草木的兴衰荣枯，倾听黄天厚土之声，探寻宇宙自然的妙趣。走进了山水，也就走出了喧嚣，给身心以清凉，给精神以沉淀，给灵魂以升华。";
        strLabel.text = str;
        strLabel.font = [UIFont systemFontOfSize:15];
        CGSize size = [strLabel boundingRectWithSize:CGSizeMake(self.collectionView.frame.size.width - 50, 0)];
        CGSize returnSize = CGSizeMake(self.collectionView.frame.size.width, size.height + 12);
        return returnSize;
    } else {
        CGSize returnSize = CGSizeMake((self.collectionView.frame.size.width - 30) / 2, 200);
        return returnSize;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        UIEdgeInsets edg = UIEdgeInsetsMake(5, 5, 5, 5);
        return edg;
    } else {
        UIEdgeInsets edg = UIEdgeInsetsMake(5, 0, 5, 0);
        return edg;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TopicMode3HeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topicMode3HeadCell forIndexPath:indexPath];
        NSString *str = @"日落时分，沏上一杯山茶，听一曲意境空远的《禅》，心神随此天籁，沉溺于玄妙的幻境里。仿佛我就是那穿梭于葳蕤山林中的一只飞鸟，时而盘旋穿梭，时而引吭高歌；仿佛我就是那潺潺流泻于山涧的一汪清泉，涟漪轻盈，浩淼长流；仿佛我就是那竦峙在天地间的一座山峦，伟岸高耸，从容绵延。我不相信佛，只是喜欢玄冥空灵的梵音经贝，与慈悲淡然的佛境禅心，在清欢中，从容幽静，自在安然。一直向往走进青的山，碧的水，体悟山水的绚丽多姿，领略草木的兴衰荣枯，倾听黄天厚土之声，探寻宇宙自然的妙趣。走进了山水，也就走出了喧嚣，给身心以清凉，给精神以沉淀，给灵魂以升华。";
        
        NSLog(@"\r\n frame:%f-%f-%f-%f", cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        [cell setContentString:str];
        
        //cell.frame = CGRectMake(oriPoint.x, oriPoint.y, self.collectionView.frame.size.width, size.height + 12);
        return cell;
    } else {
        TopicMode3FirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topicMode3FirstCell forIndexPath:indexPath];
        NSLog(@"\r\n frame:%f-%f-%f-%f", cell.frame.origin.x, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
        return cell;
    }
    
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
