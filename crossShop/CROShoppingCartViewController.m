//
//  CROShoppingCartViewController.m
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCartViewController.h"

static NSString *shoppingCartCell = @"shoppingCartCell";
@interface CROShoppingCartViewController () {
    BOOL isEditMode;
}

@end

@implementation CROShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *cellNib = [UINib nibWithNibName:@"CROShoppingCartTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:shoppingCartCell];
    self.dataArray = [[NSMutableArray alloc] init];
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    self.dataArray = [[CROShoppingCart shareInstance]getAllGoods];
    //NSLog(@"\r\n dataarray:%@", self.dataArray);
    [self.tableView reloadData];
    isEditMode = false;
    //self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arrayCount = [[self.dataArray objectAtIndex:section] objectForKey:@"goods"];
    return [arrayCount count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *secDic = [self.dataArray objectAtIndex:section];
    return [secDic objectForKey:@"dispatch"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (UIView *)tableView:(UITableView *)tableV viewForHeaderInSection:(NSInteger)section {
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
    return secView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CROShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCartCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CROShoppingCartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCartCell];
    }
    [cell changeCellMode:isEditMode];
    NSLog(@"\r\n section:%ld,row:%ld", indexPath.section, indexPath.row);
    [cell configCellByDicData:[[[self.dataArray objectAtIndex:indexPath.section] objectForKey:@"goods"] objectAtIndex:indexPath.row]];
    return cell;
}

- (void)setCellIntoEditStyle {
    for (CROShoppingCartTableViewCell *cell in self.tableView.visibleCells) {
        [cell changeCellMode:isEditMode];
    }
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

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)editAct:(id)sender {
    isEditMode = !isEditMode;
    [self setCellIntoEditStyle];
    if (isEditMode) {
        self.editBtn.title = @"编辑";
    } else {
        self.editBtn.title = @"完成";
    }
}
@end
