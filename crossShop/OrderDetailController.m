//
//  OrderDetailController.m
//  crossShop
//
//  Created by mac on 15/7/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "OrderDetailController.h"
#import "OrderDetailCell.h"
#import "OrderDetailNormalCell.h"
#import "OrderDetailItemCell.h"

static NSString *orderDetailCell = @"orderDetailCell";
static NSString *orderDetailNormalCell = @"orderDetailNormalCell";
static NSString *orderDetailItemCell = @"orderDetailItemCell";

@interface OrderDetailController ()

@end

@implementation OrderDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"OrderDetailCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:orderDetailCell];
    UINib *normalNib = [UINib nibWithNibName:@"OrderDetailNormalCell" bundle:nil];
    [self.tableView registerNib:normalNib forCellReuseIdentifier:orderDetailNormalCell];
    UINib *itemNib = [UINib nibWithNibName:@"OrderDetailItemCell" bundle:nil];
    [self.tableView registerNib:itemNib forCellReuseIdentifier:orderDetailItemCell];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        return 106;
        
        case 1:
        return 89;
        
        case 2:
        return 41;
        
        default:
        return 41;
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    }
    else {
        return 5;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        OrderDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailCell];
        }
        return cell;
        
    } else if (indexPath.section == 1) {
        OrderDetailItemCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailItemCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailItemCell];
        }
        //cell.backgroundColor = [UIColor redColor];
        return cell;
        
    } else {
        OrderDetailNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:orderDetailNormalCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[OrderDetailNormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:orderDetailNormalCell];
        }
        //cell.backgroundColor = [UIColor blueColor];
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

@end
