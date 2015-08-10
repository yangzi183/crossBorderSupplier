//
//  ReceiptController.h
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PROVINCE_COMPONENT  0
#define CITY_COMPONENT      1
#define DISTRICT_COMPONENT  2
#define kTextFieldHeight    45

@interface ReceiptController : UIViewController <UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
//@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextView *address;
@property (strong, nonatomic) IBOutlet UILabel *addrLabel;
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *identityCard;
@property (strong, nonatomic) IBOutlet UITextField *telephone;
@property (strong, nonatomic) IBOutlet UITextField *postcode;
@property (strong, nonatomic) IBOutlet UITextField *localArea;
@property (strong, nonatomic) IBOutlet UIView *areaView;
@property (strong, nonatomic) IBOutlet UIPickerView *pickView;
@property (strong, nonatomic) IBOutlet UIView *localAreaBack;
@property (strong, nonatomic) IBOutlet UIView *pickBackView;
- (IBAction)backAct:(id)sender;
- (IBAction)pickCancelAct:(id)sender;
- (IBAction)pickDoneAct:(id)sender;

@end
