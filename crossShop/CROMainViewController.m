//
//  CROMainViewController.m
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainViewController.h"

static NSString *cellName = @"mainCell";
@interface CROMainViewController () {
    NSMutableArray *flowTableData;
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
    self.mainData = [[NSMutableArray alloc]init];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.scrollEnabled = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    self.contentSizeWidth.constant = screenWidth;
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self initUI];
    [self.flowTable configFlowTable];
    //NSLog(@"\r\n flowtable,bound:%f,frame:%f", self.flowTable.bounds.size.width, self.flowTable.frame.size.width);
    [self initData];
    [self reloadTableData];
    [self.mainTableView reloadData];
    NSLog(@"\r\n height:%f,%f,%f", self.view.frame.size.height, self.mainScroll.frame.size.height, self.mainScroll.contentSize.height);
}

- (void)initUI {
    UIImage *diaperImg = [UIImage imageNamed:@"diaper_icon"];
    UIImage *milkImg = [UIImage imageNamed:@"milk_icon"];
    UIImage *foodImg = [UIImage imageNamed:@"food_icon"];
    [self.diaper configImg:diaperImg withTitle:@"纸尿裤"];
    [self.milkPower configImg:milkImg withTitle:@"奶粉"];
    [self.food configImg:foodImg withTitle:@"辅食"];
    
    UIImage *realImg = [UIImage imageNamed:@"real_icon"];
    UIImage *planeImg = [UIImage imageNamed:@"plane_icon"];
    UIImage *expressImg = [UIImage imageNamed:@"express_icon"];
    UIImage *sevenImg = [UIImage imageNamed:@"seven_icon"];
    [self.iconReal configImg:realImg withTitle:@"正品保障"];
    [self.iconPlane configImg:planeImg withTitle:@"海外直采"];
    [self.iconExpress configImg:expressImg withTitle:@"保税区直邮"];
    [self.iconSeven configImg:sevenImg withTitle:@"辅食"];
}

- (void)initData {
    flowTableData = [[NSMutableArray alloc]init];
    flowTableData = [NSMutableArray arrayWithObjects:@"http://img4q.duitang.com/uploads/item/201202/12/20120212145057_yKtnj.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/12/20120212145048_cjYNR.thumb.700_0.jpg", @"http://img5q.duitang.com/uploads/item/201202/21/20120221173426_NeyNL.thumb.700_0.jpg", @"http://img4q.duitang.com/uploads/item/201203/11/20120311211442_d4mJt.jpeg", nil];
    [self.flowTable setDataArray:flowTableData];
}

- (void)initSpecial {
    
}

- (void)reloadTableData {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"testData" ofType:@"plist"];
    NSMutableArray *mutableArr = [NSMutableArray arrayWithContentsOfFile:path];
   
    self.mainData = [NSMutableArray arrayWithArray:mutableArr];
    self.mainScroll.contentSize = CGSizeMake(screenWidth, (440 + self.mainData.count * KCELLWIDTH));
    //NSLog(@"\r\n arr:%@, dataarray:%@", mutableArr, self.mainData);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mainData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return KCELLWIDTH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CROMainDetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[CROMainDetTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    NSDictionary *dicData = [self.mainData objectAtIndex:indexPath.row];
    [cell setDicData:dicData];
    return cell;
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

@end
