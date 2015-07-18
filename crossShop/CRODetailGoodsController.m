//
//  CRODetailGoodsController.m
//  crossShop
//
//  Created by mac on 15/6/8.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CRODetailGoodsController.h"

static NSString *cellDetailGoodsName = @"detailGoodsCell";
static NSString *cellDetailGoodsImageName = @"detailGoodsImage";
static NSString *cellDetailGoodsIntroName = @"detailGoodsIntro";
static NSString *cellDetailGoodsQuestionName = @"detailGoodsQuestion";
static NSString *detailGoodsRecommendCell = @"detailGoodsRecommendCell";
static NSString *detailGoodsModeCell = @"detailGoodsModeCell";
static NSString *detailGoodsIntroDetailCell = @"detailGoodsIntroDetailCell";
static NSString *detailGoodsBrandCell = @"detailGoodsBrandCell";


@interface CRODetailGoodsController () {
    NSMutableArray *dataArray;
    INTROIMAGENAME isSelectMode;
}

@end

@implementation CRODetailGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *cellNib = [UINib nibWithNibName:@"CRODetailGoodsHeadCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellDetailGoodsName];
    UINib *cellImgNib = [UINib nibWithNibName:@"DetailGoodsImageCell" bundle:nil];
    [self.tableView registerNib:cellImgNib forCellReuseIdentifier:cellDetailGoodsImageName];
    UINib *cellIntroNib = [UINib nibWithNibName:@"DetailGoodsIntroCell" bundle:nil];
    [self.tableView registerNib:cellIntroNib forCellReuseIdentifier:cellDetailGoodsIntroName];
    UINib *cellQuestionNib = [UINib nibWithNibName:@"DetailGoodsQuestionCell" bundle:nil];
    [self.tableView registerNib:cellQuestionNib forCellReuseIdentifier:cellDetailGoodsQuestionName];
    
    
    UINib *detailGoodsRecommendCellNib = [UINib nibWithNibName:@"DetailGoodsRecommendCell" bundle:nil];
    [self.tableView registerNib:detailGoodsRecommendCellNib forCellReuseIdentifier:detailGoodsRecommendCell];
    UINib *detailGoodsModeCellNib = [UINib nibWithNibName:@"DetailGoodsModeCell" bundle:nil];
    [self.tableView registerNib:detailGoodsModeCellNib forCellReuseIdentifier:detailGoodsModeCell];
    UINib *detailGoodsIntroDetailCellNib = [UINib nibWithNibName:@"DetailGoodsIntroDetailCell" bundle:nil];
    [self.tableView registerNib:detailGoodsIntroDetailCellNib forCellReuseIdentifier:detailGoodsIntroDetailCell];
    UINib *detailGoodsBrandCellNib = [UINib nibWithNibName:@"DetailGoodsBrandCell" bundle:nil];
    [self.tableView registerNib:detailGoodsBrandCellNib forCellReuseIdentifier:detailGoodsBrandCell];
    
    //self.dicDetailData = [[NSDictionary alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.itemImgArray = [[NSArray alloc]init];
    //dataArray = [[NSMutableArray alloc]init];
    NSLog(@"\r\n viewdidload");
}

- (void)setDicDetailData:(NSDictionary *)dicDetailData {
    NSLog(@"\r\n setDicDetailData:%@", dicDetailData);
    _dicDetailData = dicDetailData;
    [self changeDetailCellWithTag:ITEMDETAIL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return DETAIL_CELL_HEAD_HEIGHT;
        case 1:
            return DETAIL_CELL_RECOMMEND_HEIGHT;
        case 2:
            return DETAIL_CELL_BRAND_HEIGHT;
        case 3:
            return DETAIL_CELL_INTRO_HEIGHT;
        case 4:
            return DETAIL_CELL_MODE_HEIGHT;
        case 5:
            return 800;
            
        default:
            return DETAIL_CELL_HEAD_HEIGHT;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"\r\n count:%ld", dataArray.count);
    if (section == 5) {
        return dataArray.count;
    } else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"\r\n indexrow:%ld", indexPath.row);
    switch (indexPath.section) {
        case 0: {
            CRODetailGoodsHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsName forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[CRODetailGoodsHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsName];
            };
            
            return cell;
        }
        case 1: {
            DetailGoodsRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsRecommendCell forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsRecommendCell];
            }
            return cell;
        }
        case 2: {
            DetailGoodsBrandCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsBrandCell forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsBrandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsBrandCell];
            }
            return cell;
        }
        case 3: {
            DetailGoodsIntroDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsIntroDetailCell forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsIntroDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsIntroDetailCell];
            }
            return cell;
        }
        case 4: {
            DetailGoodsModeCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsModeCell forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsModeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsModeCell];
            }
            return cell;
        }
        case 5: {
            if (isSelectMode == ITEMDETAIL) {
                DetailGoodsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsImageName forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsImageName];
                }
                return cell;
            } else if (isSelectMode == BUYINTRO) {
                DetailGoodsIntroCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsIntroName forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsIntroCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsIntroName];
                }
                return cell;
            } else {
                DetailGoodsQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsQuestionName forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsQuestionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsQuestionName];
                }
                return cell;
            }
        }
            
        default:
            return nil;
    }
    
    
    
    /*if (indexPath.row == 0) {
        CRODetailGoodsHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsName forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[CRODetailGoodsHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsName];
        }
        cell.itemDetail.delegate = self;
        cell.buyIntro.delegate = self;
        cell.moreQuestion.delegate = self;
        return cell;
    } else {
        if (isSelectMode == ITEMDETAIL) {
            DetailGoodsImageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsImageName forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsImageName];
            }
            return cell;
        } else if (isSelectMode == BUYINTRO) {
            DetailGoodsIntroCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsIntroName forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsIntroCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsIntroName];
            }
            return cell;
        } else {
            DetailGoodsQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsQuestionName forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsQuestionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsQuestionName];
            }
            return cell;
        }
    }*/
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return false;
}

- (void)changeDetailCellWithTag:(NSInteger)setTag {
    NSLog(@"\r\n tag:%ld", (long)setTag);
    dataArray = [[NSMutableArray alloc]initWithObjects:@"test1", @"test2", @"test3", @"test4", @"test5", @"test6", nil];
    isSelectMode = (int)setTag;
    
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
