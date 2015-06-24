//
//  PersonalCenterController.m
//  crossShop
//
//  Created by mac on 15/6/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "PersonalCenterController.h"

static NSString *personalCell = @"personalCell";
static NSString *personFootCell = @"personFootCell";

@interface PersonalCenterController () {
    NSMutableArray *dataArray;
}

@end

@implementation PersonalCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *nib = [UINib nibWithNibName:@"PersonalCenterCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:personalCell];
    UINib *footNib = [UINib nibWithNibName:@"PersonCenterFootCell" bundle:nil];
    [self.tableView registerNib:footNib forCellReuseIdentifier:personFootCell];
    [self setHideTableViewFoot:self.tableView];
    [self initDataArray];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)initDataArray {
    dataArray = [[NSMutableArray alloc] init];
    NSArray *iconArray = [[NSArray alloc] initWithObjects:@"person_my_order", @"person_my_baby", @"person_my_scan", @"person_my_vouchers", @"person_friend", @"person_notification", nil];
    NSArray *titleArray = [[NSArray alloc] initWithObjects:@"我的订单", @"我的宝宝信息", @"我的浏览记录", @"我的代金券", @"邀请好友", @"通知", nil];
    for (NSInteger i = 0 ; i < [iconArray count]; i++) {
        NSMutableDictionary *dicData = [[NSMutableDictionary alloc]init];
        [dicData setObject:[iconArray objectAtIndex:i] forKey:kPersonalIconCell];
        [dicData setObject:[titleArray objectAtIndex:i] forKey:kPersonalTitleCell];
        [dataArray addObject:dicData];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count] + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [dataArray count]) {
        return 45;
    } else {
        CGFloat height = (self.tableView.frame.size.height - 410);
        CGFloat footHeight = (height > 80) ? height : 80;
        return footHeight;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [dataArray count]) {
        return true;
    } else {
        return false;
    }
}

- (void)setHideTableViewFoot:(UITableView *)tableView {
    UIView *viewFooter = [[UIView alloc]init];
    viewFooter.backgroundColor = [UIColor clearColor];
    tableView.tableFooterView = viewFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 140;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PersonalCenterHeadView *head = [[PersonalCenterHeadView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 140)];
    head.delegate = self;
    return head;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < [dataArray count]) {
        PersonalCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PersonalCenterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        }
        [cell setCellInfoByDic:[dataArray objectAtIndex:indexPath.row]];
        return cell;
    } else {
        PersonCenterFootCell *cell = [tableView dequeueReusableCellWithIdentifier:personFootCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[PersonCenterFootCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personFootCell];
        }
        cell.backgroundColor = [UIColor blueColor];
        return cell;
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

- (void)segueIntoLoginView {
    [self performSegueWithIdentifier:@"showLoginView" sender:nil];
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
