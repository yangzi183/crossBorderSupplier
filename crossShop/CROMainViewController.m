//
//  CROMainViewController.m
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainViewController.h"
#import "DetailGoodsViewController.h"
#import "CategoryViewController.h"
#import "TopicMode2Controller.h"
#import "TopicMode3Controller.h"
#import "MJRefresh.h"
#import "ModelData.h"

static NSString *cellName = @"mainCell";
static NSString *cellTitleName = @"titleCell";
NSInteger g_iPage = 1;
@interface CROMainViewController () {
    NSMutableArray *flowTableData;
    UIImageView *barLineView;
    CATEGORY_TYPE categoryType;
    NSString *modelID;
    NSDictionary *tomorrowDic;
    NSMutableArray *itemsArray;
}

@end

@implementation CROMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    UINib *cellNib = [UINib nibWithNibName:@"CROMainDetTableViewCell" bundle:nil];
    [self.mainTableView registerNib:cellNib forCellReuseIdentifier:cellName];
    UINib *cellTitleNib = [UINib nibWithNibName:@"CROMainTitleTableViewCell" bundle:nil];
    [self.mainTableView registerNib:cellTitleNib forCellReuseIdentifier:cellTitleName];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    itemsArray = [[NSMutableArray alloc] init];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    [notiCenter addObserver:self selector:@selector(showTopicView:) name:kNOTIFICATION_SHOW_TOPIC_VIEW object:nil];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 1)];
    lineView.backgroundColor = [CROCommonAPI colorWithHexString:@"#82d6d6"];
    [self.view addSubview:lineView];
    ShoppingCartItem *shopItem = [[ShoppingCartItem alloc] initWithFrame:CGRectMake(0, 0, kSHOPPING_CART_ITEM_WIDTH, kSHOPPING_CART_ITEM_HEIGHT)];
    shopItem.delegate = self;
    shopItem.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *shopRightItem = [[UIBarButtonItem alloc] initWithCustomView:shopItem];
    self.navigationItem.rightBarButtonItem = shopRightItem;
    [self setupRefresh];
    [self reloadTableData];
}

- (void)setupRefresh {
    __unsafe_unretained CROMainViewController *mainCtrl = self;
    [self.mainTableView addFooterWithCallback:^{
        NSLog(@"\r\n footcallback");
        [mainCtrl footerRereshing];
    }];
    //[self.mainTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    self.mainTableView.footerPullToRefreshText = @"上拉可以加载更多商品";
    self.mainTableView.footerReleaseToRefreshText = @"松开马上加载更多商品";
    self.mainTableView.footerRefreshingText = @"商品正在努力加载中，请稍后...";
}

- (void)viewWillAppear:(BOOL)animated {
    barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar];
    barLineView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar];
    barLineView.hidden = NO;
}

/*- (void)viewDidAppear:(BOOL)animated {
    [self reloadTableData];
}*/

- (void)reloadTableData {
    HTTPRequestDic completeBlock = ^(NSDictionary *dic) {
        //NSLog(@"\r\n all goods dic:%@", dic);
        tomorrowDic = [dic objectForKey:@"tomorrow"];
        itemsArray = [NSMutableArray arrayWithArray:[dic objectForKey:@"items"]];
        //NSLog(@"\r\n itemsarraycount:%ld", itemsArray.count);
        [self.mainTableView reloadData];
    };
    [ModelData getAllGoodsWithBlock:completeBlock page:g_iPage];
    
    /*NSString *path = [[NSBundle mainBundle]pathForResource:@"testData" ofType:@"plist"];
    NSMutableArray *mutableArr = [NSMutableArray arrayWithContentsOfFile:path];*/
   
    //self.mainData = [NSMutableArray arrayWithArray:mutableArr];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (itemsArray.count + 2);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        if (self.view.frame.size.width > 320) {
            return 535;
        }
        return kTitleCellHeight;
    } else {
        return KCELLWIDTH;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        CROMainTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTitleName];
        if (cell == nil) {
            cell = [[CROMainTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellTitleName];
        }
        cell.frame = CGRectMake(0, 0, screenWidth, kTitleCellHeight);
        UITapGestureRecognizer *milkTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(milkTapAct)];
        UITapGestureRecognizer *diaperTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diaperTapAct)];
        UITapGestureRecognizer *foodTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foodTapAct)];
        [cell.milkPower addGestureRecognizer:milkTap];
        [cell.diaper addGestureRecognizer:diaperTap];
        [cell.food addGestureRecognizer:foodTap];
        //NSLog(@"\r\n width:%f-%f", cell.diaper.frame.size.width, cell.diaper.frame.size.height);
        return cell;
    } else {
        CROMainDetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
        if (cell == nil) {
            cell = [[CROMainDetTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
        }
        if (indexPath.row == 1) {
            [cell setDicData:tomorrowDic tomorow:YES];
        } else {
            NSDictionary *itemData = [itemsArray objectAtIndex:indexPath.row - 2];
            [cell setDicData:itemData tomorow:false];
        }
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return NO;
    } else {
        return YES;
    }
}

- (void)footerRereshing
{
    // 1.添加假数据
    g_iPage++;
    HTTPRequestDic completeBlock = ^(NSDictionary *dic) {
        //NSLog(@"\r\n all goods dic:%@", dic);
        NSArray *getArray = [dic objectForKey:@"items"];
        //NSLog(@"\r\n arraycount:%ld", getArray.count);
        for (int i = 0; i < getArray.count; i++) {
            [itemsArray addObject:[getArray objectAtIndex:i]];
        }
        if ([[dic objectForKey:@"items"] count] == 0) {
            g_iPage--;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 刷新表格
            [self.mainTableView reloadData];
            
            // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
            [self.mainTableView footerEndRefreshing];
        });
    };
    [ModelData getAllGoodsWithBlock:completeBlock page:g_iPage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        //NSLog(@"\r\n didSelectRowAtIndexPath:%ld", indexPath.row);
        [self performSegueWithIdentifier:@"showGoodsDetail" sender:indexPath];
    }
}

- (void)showTopicView: (NSNotification *)sender {
    NSDictionary *dicData = (NSDictionary *)[sender object];
    NSNumber *model_type = [dicData objectForKey:@"model_type"];
    modelID = [dicData objectForKey:@"model_id"];
    NSInteger type = [model_type integerValue];
    
    if (type == 1) {
        NSLog(@"\r\n into type 1");
    } else if (type == 2) {
        [self performSegueWithIdentifier:@"showTopicView2" sender:nil];
    } else if (type == 3) {
        [self performSegueWithIdentifier:@"showTopicView3" sender:nil];
    }
    //NSLog(@"\r\n tagnuber:%ld", [tagNumber integerValue]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGoodsDetail"]) {
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        NSLog(@"\r\n segueindex:%ld", indexPath.row);
        if (indexPath.row == 1) {
            [segue.destinationViewController setItemId:[tomorrowDic objectForKey:@"id"]];
        } else if (indexPath.row > 1) {
            NSDictionary *nowDic = [itemsArray objectAtIndex:(indexPath.row - 2)];
            [segue.destinationViewController setItemId:[nowDic objectForKey:@"id"]];
        }
    } else if ([segue.identifier isEqualToString:@"showTopicView2"]) {
        [segue.destinationViewController setModel_id:modelID];
    } else if ([segue.identifier isEqualToString:@"showCategoryView"]) {
        [segue.destinationViewController setCategoryViewType:categoryType];
    } else if ([segue.identifier isEqualToString:@"showTopicView3"]) {
        [segue.destinationViewController setModel_id:modelID];
    }
}

- (void)tapShoppingCartView {
    [self performSegueWithIdentifier:@"showShoppingCartView" sender:nil];
}

- (void)milkTapAct {
    categoryType = CATEGORY_MILK;
    [self performSegueWithIdentifier:@"showCategoryView" sender:nil];
}

- (void)diaperTapAct {
    categoryType = CATEGORY_DIAPER;
    [self performSegueWithIdentifier:@"showCategoryView" sender:nil];
}

- (void)foodTapAct {
    categoryType = CATEGORY_FOOD;
    [self performSegueWithIdentifier:@"showCategoryView" sender:nil];
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
