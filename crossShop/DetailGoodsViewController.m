//
//  DetailGoodsViewController.m
//  crossShop
//
//  Created by mac on 15/7/28.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "DetailGoodsViewController.h"

static NSString *cellDetailGoodsName = @"detailGoodsCell";
static NSString *cellDetailGoodsImageName = @"detailGoodsImage";
static NSString *cellDetailGoodsIntroName = @"detailGoodsIntro";
static NSString *cellDetailGoodsQuestionName = @"detailGoodsQuestion";
static NSString *detailGoodsRecommendCell = @"detailGoodsRecommendCell";
static NSString *detailGoodsModeCell = @"detailGoodsModeCell";
static NSString *detailGoodsIntroDetailCell = @"detailGoodsIntroDetailCell";
static NSString *detailGoodsBrandCell = @"detailGoodsBrandCell";
static NSString *detailGoodsSectionHeadCell = @"detailGoodsSectionHeadCell";

@interface DetailGoodsViewController () {
    NSMutableArray *dataArray;
    INTROIMAGENAME isSelectMode;
    NSArray *sectionHeadArray;
    NSIndexPath *detailIndexPath;
}

@end

@implementation DetailGoodsViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    UINib *detailGoodsSectionHeadCellNib = [UINib nibWithNibName:@"DetailGoodsSectionHeadCell" bundle:nil];
    [self.tableView registerNib:detailGoodsSectionHeadCellNib forCellReuseIdentifier:detailGoodsSectionHeadCell];
    
    //self.dicDetailData = [[NSDictionary alloc]init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.itemImgArray = [[NSArray alloc]init];
    //dataArray = [[NSMutableArray alloc]init];
    sectionHeadArray = [[NSArray alloc] initWithObjects:@"会买妈妈育儿师推荐", @"品牌介绍", @"产品说明", nil];
}

- (void)setDicDetailData:(NSDictionary *)dicDetailData {
    NSLog(@"\r\n setDicDetailData:%@", dicDetailData);
    _dicDetailData = dicDetailData;
    [self changeDetailCellWithTag:ITEMDETAIL];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return DETAIL_CELL_HEAD_HEIGHT;
        case 1:
            if (indexPath.row == 0) {
                return kDetailGoodsSectionHeadHeight;
            }
            return DETAIL_CELL_RECOMMEND_HEIGHT;
        case 2:
            if (indexPath.row == 0) {
                return kDetailGoodsSectionHeadHeight;
            }
            return DETAIL_CELL_BRAND_HEIGHT;
        case 3:
            if (indexPath.row == 0) {
                return kDetailGoodsSectionHeadHeight;
            }
            return DETAIL_CELL_INTRO_HEIGHT;
        case 4:
            return DETAIL_CELL_MODE_HEIGHT;
        case 5:
            if (isSelectMode == ITEMDETAIL) {
                return kDetailGoodsCellImageHeight;
            } else if (isSelectMode == BUYINTRO) {
                return kDetailGoodsIntroCellHeight;
            } else {
                return kDetailGoodsQuestionCellHeight;
            }
            
        default:
            return DETAIL_CELL_HEAD_HEIGHT;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 5 || section == 4) {
        return 0;
    } else {
        return kThickLineHeight;
    }
}

/*
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
 if (section == 1 || section == 2 || section == 3) {
 return kDetailSectionHeaderHeight;
 } else {
 return 0;
 }
 }
 
 - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
 if (section == 1 || section == 2 || section == 3) {
 UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, kDetailSectionHeaderHeight)];
 UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 150, 20)];
 label.font = [UIFont systemFontOfSize:15];
 label.text = @"会买妈妈育儿师推荐";
 [headView addSubview:label];
 headView.backgroundColor = [UIColor clearColor];
 label.backgroundColor = [UIColor clearColor];
 return headView;
 } else {
 return nil;
 }
 }
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, kThickLineHeight)];
    lineView.backgroundColor = [CROCommonAPI colorWithHexString:@"#F5F6F6"];
    return lineView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"\r\n count:%ld", dataArray.count);
    if (section == 1 || section == 2 || section == 3) {
        return 2;
    } else if (section == 5){
        if (isSelectMode == ITEMDETAIL) {
            return dataArray.count;
        } else {
            return 1;
        }
    } else {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"\r\n section:%ld, indexrow:%ld", indexPath.section, indexPath.row);
    switch (indexPath.section) {
        case 0: {
            CRODetailGoodsHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsName forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[CRODetailGoodsHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsName];
            };
            
            return cell;
        }
        case 1: {
            if (indexPath.row == 0) {
                DetailGoodsSectionHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsSectionHeadCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsSectionHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsSectionHeadCell];
                }
                cell.titleLabel.text = [sectionHeadArray objectAtIndex:indexPath.section - 1];
                return cell;
            } else {
                DetailGoodsRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsRecommendCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsRecommendCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsRecommendCell];
                }
                return cell;
            }
        }
        case 2: {
            if (indexPath.row == 0) {
                DetailGoodsSectionHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsSectionHeadCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsSectionHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsSectionHeadCell];
                }
                cell.titleLabel.text = [sectionHeadArray objectAtIndex:indexPath.section - 1];
                return cell;
            } else {
                DetailGoodsBrandCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsBrandCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsBrandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsBrandCell];
                }
                return cell;
            }
        }
        case 3: {
            if (indexPath.row == 0) {
                DetailGoodsSectionHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsSectionHeadCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsSectionHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsSectionHeadCell];
                }
                cell.titleLabel.text = [sectionHeadArray objectAtIndex:indexPath.section - 1];
                return cell;
            } else {
                DetailGoodsIntroDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsIntroDetailCell forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsIntroDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsIntroDetailCell];
                }
                return cell;
            }
        }
        case 4: {
            DetailGoodsModeCell *cell = [tableView dequeueReusableCellWithIdentifier:detailGoodsModeCell forIndexPath:indexPath];
            if (cell == nil) {
                cell = [[DetailGoodsModeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:detailGoodsModeCell];
            }
            cell.itemDetail.delegate = self;
            cell.buyIntro.delegate = self;
            cell.moreQuestion.delegate = self;
            
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
                [cell updateViewToConstraint];
                return cell;
            } else {
                DetailGoodsQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDetailGoodsQuestionName forIndexPath:indexPath];
                if (cell == nil) {
                    cell = [[DetailGoodsQuestionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDetailGoodsQuestionName];
                }
                NSLog(@"\r\n width:%f", cell.frame.size.width);
                [cell configView];
                return cell;
            }
        }
            
        default:
            return nil;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return false;
}

- (void)changeDetailCellWithTag:(NSInteger)setTag {
    dataArray = [[NSMutableArray alloc]initWithObjects:@"test1", @"test2", @"test3", @"test4", @"test5", @"test6", nil];
    isSelectMode = (int)setTag;
    [self.tableView reloadData];
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
