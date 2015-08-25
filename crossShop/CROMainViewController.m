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

static NSString *cellName = @"mainCell";
static NSString *cellTitleName = @"titleCell";
@interface CROMainViewController () {
    NSMutableArray *flowTableData;
    UIImageView *barLineView;
    CATEGORY_TYPE categoryType;
    NSString *modelID;
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
    self.mainData = [[NSMutableArray alloc]init];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
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
}

- (void)viewWillAppear:(BOOL)animated {
    barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar];
    barLineView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    barLineView = [CROCommonAPI findHairlineImageViewUnder:self.navigationController.navigationBar];
    barLineView.hidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [self reloadTableData];
    [self.mainTableView reloadData];
}

- (void)reloadTableData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"testData" ofType:@"plist"];
    NSMutableArray *mutableArr = [NSMutableArray arrayWithContentsOfFile:path];
   
    self.mainData = [NSMutableArray arrayWithArray:mutableArr];
    //self.mainScroll.contentSize = CGSizeMake(screenWidth, (440 + self.mainData.count * KCELLWIDTH));
    //NSLog(@"\r\n arr:%@, dataarray:%@", mutableArr, self.mainData);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.mainData.count + 1);
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
        NSDictionary *dicData = [self.mainData objectAtIndex:(indexPath.row - 1)];
        [cell setDicData:dicData];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        NSLog(@"\r\n didSelectRowAtIndexPath:%ld", indexPath.row);
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
        
        NSDictionary *dicData = [self.mainData objectAtIndex:(indexPath.row - 1)];
        [segue.destinationViewController setDicDetailData:dicData];
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
