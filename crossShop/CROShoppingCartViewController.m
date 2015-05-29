//
//  CROShoppingCartViewController.m
//  crossShop
//
//  Created by mac on 15/5/27.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROShoppingCartViewController.h"

static NSString *shoppingCartCell = @"shoppingCartCell";
@interface CROShoppingCartViewController ()

@end

@implementation CROShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *cellNib = [UINib nibWithNibName:@"CROShoppingCartTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:shoppingCartCell];
    self.dataArray =
    [[CROShoppingCart shareInstance]getAllGoods];
    //NSLog(@"\r\n dataarray:%@", self.dataArray);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testChange:) name:@"testnot" object:nil];
    
    CGFloat navHeight = self.navigationController.navigationBar.bounds.size.height;
    NSLog(@"\r\n height:%f", navHeight);
    //self.tableViewTopMargin.constant = navHeight;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)testChange: (NSNotification *)note {
    
    NSLog(@"\r\n note:%@,userinfo:%@", note, [note object]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
        /*CGFloat navHeight = self.navigationController.navigationBar.bounds.size.height;
        NSLog(@"\r\n height:%f", navHeight);*/
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *goodsArray = [self.dataArray objectAtIndex:section];
    return [goodsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CROShoppingCartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCartCell forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CROShoppingCartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCartCell];
    }
    [cell changeCellMode:false];
    return cell;
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
