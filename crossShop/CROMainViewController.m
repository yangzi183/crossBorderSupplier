//
//  CROMainViewController.m
//  crossShop
//
//  Created by apple on 15/5/19.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CROMainViewController.h"

static NSString *cellName = @"mainCell";
static NSString *cellTitleName = @"titleCell";
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
    UINib *cellTitleNib = [UINib nibWithNibName:@"CROMainTitleTableViewCell" bundle:nil];
    [self.mainTableView registerNib:cellTitleNib forCellReuseIdentifier:cellTitleName];
    self.mainData = [[NSMutableArray alloc]init];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    //self.contentSizeWidth.constant = screenWidth;
    
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
        NSLog(@"\r\n width:%f-%f", cell.diaper.frame.size.width, cell.diaper.frame.size.height);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
