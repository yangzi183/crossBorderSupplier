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
    return 800;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"\r\n count:%ld", dataArray.count);
    return dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"\r\n indexrow:%ld", indexPath.row);
    if (indexPath.row == 0) {
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
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return false;
}

- (void)changeDetailCellWithTag:(NSInteger)setTag {
    NSLog(@"\r\n tag:%ld", (long)setTag);
    dataArray = [[NSMutableArray alloc]initWithObjects:@"test1", @"test2", @"test3", nil];
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
