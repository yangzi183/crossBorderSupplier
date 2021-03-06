//
//  CROShoppingCartViewController.m
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCartViewController.h"
#import "commonConfig.h"
#import "CROCommonAPI.h"

static NSString *shoppingCartCell = @"shoppingCartCell";
static NSInteger totalPriceReal;
static NSInteger totalOriPriceReal;
@interface CROShoppingCartViewController () {
    BOOL isEditMode;
    NSMutableDictionary *dataPriceDic;
    BOOL isSelectAll;
    UIImageView *barLineView;
}

@end

@implementation CROShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *cellNib = [UINib nibWithNibName:@"CROShoppingCartTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:shoppingCartCell];
    self.dataArray = [[NSMutableArray alloc] init];
    dataPriceDic = [[NSMutableDictionary alloc]init];
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataArray = [[CROShoppingCart shareInstance]getAllGoods];
    //NSLog(@"\r\n dataarray:%@", self.dataArray);
    [self.tableView reloadData];
    isEditMode = false;
    [self calculateTotalPriceByDicData];
    [self setHideTableViewFoot:self.tableView];
    self.selectAll.selected = YES;
    isSelectAll = self.selectAll.selected;
    [self.selectAll setImage:[UIImage imageNamed:@"item_select_true"] forState:UIControlStateSelected];
    [self.selectAll setImage:[UIImage imageNamed:@"item_select_false"] forState:UIControlStateNormal];
    //self.view.backgroundColor = [CROCommonAPI colorWithHexString:@"#f5f6f6"];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [CROCommonAPI colorWithHexString:kThickLineColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    willLoadToRemoveLine
}

- (void)viewWillDisappear:(BOOL)animated {
    willDisappearToAddLine
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arrayCount = [[self.dataArray objectAtIndex:section] objectForKey:@"goods"];
    return [arrayCount count];
}

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *secDic = [self.dataArray objectAtIndex:section];
    return [secDic objectForKey:@"dispatch"];
}*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCROShoppingCartTableViewCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

/*- (UIView *)tableView:(UITableView *)tableV viewForHeaderInSection:(NSInteger)section {
    NSString *titleStr = [self tableView:tableV titleForHeaderInSection:section];
    UILabel *sectionHeader = [[UILabel alloc]initWithFrame:CGRectMake(8, 5, self.tableView.frame.size.width, 20)];
    sectionHeader.text = titleStr;
    sectionHeader.backgroundColor = [UIColor clearColor];
    sectionHeader.font = [UIFont systemFontOfSize:15];
    sectionHeader.textColor = [CROCommonAPI colorWithHexString:@"#9b9b9b"];
    UIView *secView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 29)];
    secView.backgroundColor = self.tableView.backgroundColor;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 28, self.tableView.frame.size.width, 0.5)];
    lineView.backgroundColor = [CROCommonAPI colorWithHexString:@"#d8d8d8"];
    [secView addSubview:lineView];
    [secView addSubview:sectionHeader];
    //return secView;
    return nil;
}*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CROShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCartCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CROShoppingCartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCartCell];
    }
    [cell changeCellMode:isEditMode];
    //NSLog(@"\r\n section:%ld,row:%ld", indexPath.section, indexPath.row);
    [cell configCellByDicData:[[[self.dataArray objectAtIndex:indexPath.section] objectForKey:@"goods"] objectAtIndex:indexPath.row]];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showGoodsDetail" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showGoodsDetail"]) {
        ;
    }
}
- (void)setCellIntoEditStyle {
    for (CROShoppingCartTableViewCell *cell in self.tableView.visibleCells) {
        [cell changeCellMode:isEditMode];
    }
}

- (void)setHideTableViewFoot:(UITableView *)tableView {
    UIView *viewFooter = [[UIView alloc]init];
    viewFooter.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = viewFooter;
}

- (void)calculateTotalPriceByDicData {
    totalOriPriceReal = 0;
    totalPriceReal = 0;
    for (int section = 0; section < self.dataArray.count; section ++) {
        NSDictionary *sectionDic = self.dataArray[section];
        if ([sectionDic objectForKey:@"goods"]) {
            NSArray *goodArray = [sectionDic objectForKey:@"goods"];
            for (int row = 0; row < goodArray.count; row++) {
                NSDictionary *rowDic = goodArray[row];
                if ([rowDic objectForKey:@"itemPrice"] && [rowDic objectForKey:@"itemCount"]) {
                    NSInteger goodPrice = [(NSNumber *)[rowDic objectForKey:@"itemPrice"]integerValue];
                    NSInteger goodCountReal = [(NSNumber *)[rowDic objectForKey:@"itemCount"]integerValue];
                    totalPriceReal += (goodPrice * goodCountReal);
                }
                if ([rowDic objectForKey:@"itemOriPrice"] && [rowDic objectForKey:@"itemCount"]) {
                    NSInteger goodPrice = [(NSNumber *)[rowDic objectForKey:@"itemOriPrice"]integerValue];
                    NSInteger goodCountReal = [(NSNumber *)[rowDic objectForKey:@"itemCount"]integerValue];
                    totalOriPriceReal += (goodPrice * goodCountReal);
                }
                [dataPriceDic setObject:@"true" forKey:[rowDic objectForKey:@"itemID"]];
            }
        }
    }
    //NSLog(@"\r\n price:%ld,ori:%ld", (long)totalPriceReal, (long)totalOriPriceReal);
    [self updatePriceLabel];
}

- (void)calculatePrice: (NSInteger)totalPrice oriPrice:(NSInteger)oriPrice {
    totalPriceReal += totalPrice;
    totalOriPriceReal += oriPrice;
    //NSLog(@"\r\n totalPrice:%ld, oriPrice:%ld,price:%ld,oriprice:%ld", (long)totalPrice, (long)oriPrice, (long)totalPriceReal, (long)totalOriPriceReal);
    [self updatePriceLabel];
}

- (void)calculatePriceIfSelect:(NSInteger)totalPrice oriPrice:(NSInteger)oriPrice mode:(BOOL)mode goodId:(NSString *)goodId {
    //NSLog(@"\r\n mode:%d,goodid:%@", mode, goodId);

    if ([[dataPriceDic objectForKey:goodId] isEqualToString:@"true"] && mode == false) {
        totalPriceReal -= totalPrice;
        totalOriPriceReal -= oriPrice;
        [dataPriceDic setObject:@"false" forKey:goodId];
    } else if ([[dataPriceDic objectForKey:goodId] isEqualToString:@"false"] && mode == true) {
        totalPriceReal += totalPrice;
        totalOriPriceReal += oriPrice;
        [dataPriceDic setObject:@"true" forKey:goodId];
    }
    if (mode == false) {
        [self selectAllBtnIfSelect:false];
    }
    [self updatePriceLabel];
}

- (void)updatePriceLabel {
    self.totalPriceReal.text = [NSString stringWithFormat:@"%ld", (long)totalPriceReal];
    self.totalDownPrice.text = [NSString stringWithFormat:@"%ld", (long)(totalOriPriceReal - totalPriceReal)];
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)editAct:(id)sender {
    if (isEditMode) {
        self.editBtn.title = @"编辑";
    } else {
        self.editBtn.title = @"完成";
    }
    isEditMode = !isEditMode;
    [self setCellIntoEditStyle];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[[self.dataArray objectAtIndex:indexPath.section] objectForKey:@"goods"] removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self calculateTotalPriceByDicData];
    }
}
- (IBAction)selectAllAct:(id)sender {
    [self selectAllBtnIfSelect:(!isSelectAll)];
    for (CROShoppingCartTableViewCell *cell in self.tableView.visibleCells) {
        if (isSelectAll) {
            [cell selectGoodIfSelected:true];
        } else {
            [cell selectGoodIfSelected:false];
        }
    }
}

- (void)selectAllBtnIfSelect: (BOOL)isSel {
    isSelectAll = isSel;
    self.selectAll.selected = isSelectAll;
}

- (IBAction)confirmOrderAct:(id)sender {
    [self performSegueWithIdentifier:@"toOrderConfirmView" sender:nil];
}
@end
