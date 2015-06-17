//
//  TopicMode2Controller.m
//  crossShop
//
//  Created by mac on 15/6/12.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "TopicMode2Controller.h"
#import "CROCommonAPI.h"

static NSString *topicMode2HeadCell = @"topicMode2Head";
static NSString *topicMode2ItemCell = @"topicMode2Item";

@interface TopicMode2Controller ()

@end

@implementation TopicMode2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINib *headNib = [UINib nibWithNibName:@"TopicMode2HeadCell" bundle:nil];
    [self.tableView registerNib:headNib forCellReuseIdentifier:topicMode2HeadCell];
    UINib *itemNib = [UINib nibWithNibName:@"TopicMode2ItemCell" bundle:nil];
    [self.tableView registerNib:itemNib forCellReuseIdentifier:topicMode2ItemCell];
    
    //UIBarButtonItem *btnShare = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareAct)];
    //btnShare.image = [UIImage imageNamed:@"shopping_cart_icon"];
    [self addItemsToBar];

}

- (void)addItemsToBar {
    UIBarButtonItem *btnShare = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"share_icon"] style:UIBarButtonItemStyleBordered target:self action:@selector(shareAct)];
    btnShare.tintColor = [CROCommonAPI colorWithHexString:@"#82D6D6"];
    UIBarButtonItem *btnShoppingCart = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shopping_cart_icon"] style:UIBarButtonItemStyleBordered target:self action:@selector(shoppingCartAct)];
    btnShoppingCart.tintColor = [CROCommonAPI colorWithHexString:@"#82D6D6"];
    NSArray *btnArrays = [[NSArray alloc] initWithObjects:btnShare, btnShoppingCart, nil];
    [self.navigationItem setRightBarButtonItems:btnArrays];
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
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return kTopicMode2HeadCellHeight;
    } else {
        return kTopicMode2ItemCellHeight;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TopicMode2HeadCell *cell = [tableView dequeueReusableCellWithIdentifier:topicMode2HeadCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[TopicMode2HeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topicMode2HeadCell];
        }
        return cell;
    } else {
        TopicMode2ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:topicMode2ItemCell forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[TopicMode2ItemCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topicMode2ItemCell];
        }
        return cell;
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return false;
    } else {
        return true;
    }
}

- (void)shareAct {
    
}

- (void)shoppingCartAct {
    //[self performSegueWithIdentifier:@"showShoppingCartView" sender:nil];
    [self performSegueWithIdentifier:@"showShoppingCartView" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)backView:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
