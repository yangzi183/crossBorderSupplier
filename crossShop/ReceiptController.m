//
//  ReceiptController.m
//  crossShop
//
//  Created by mac on 15/7/6.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ReceiptController.h"
#import "CROCommonAPI.h"
#import "commonConfig.h"

@interface ReceiptController () {
    NSMutableArray *cellArray;
    UIImageView *barLineView;
    UIView *lineView;
    NSDictionary *areaDic;
    NSArray *province;
    NSArray *city;
    NSArray *district;
    NSString *selectedProvince;
    CGPoint oriPoint;
    CGPoint curPoint;
}

@end

@implementation ReceiptController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.address.delegate = self;
    [self.userName setValue:[CROCommonAPI colorWithHexString:@"#B8B8B8"] forKeyPath:@"_placeholderLabel.textColor"];
    self.userName.delegate = self;
    
    [self.identityCard setValue:[CROCommonAPI colorWithHexString:@"#B8B8B8"] forKeyPath:@"_placeholderLabel.textColor"];
    self.identityCard.delegate = self;
    
    [self.telephone setValue:[CROCommonAPI colorWithHexString:@"#B8B8B8"] forKeyPath:@"_placeholderLabel.textColor"];
    self.telephone.delegate = self;
    
    [self.postcode setValue:[CROCommonAPI colorWithHexString:@"#B8B8B8"] forKeyPath:@"_placeholderLabel.textColor"];
    self.postcode.delegate = self;
    
    [self.localArea setValue:[CROCommonAPI colorWithHexString:@"#B8B8B8"] forKeyPath:@"_placeholderLabel.textColor"];
    UITapGestureRecognizer *tapArea = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAreaView)];
    [self.localAreaBack addGestureRecognizer:tapArea];
    [self removePickView];
    [self configPickView];

    UITapGestureRecognizer *tapPickRemove = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removePickView)];
    [self.areaView addGestureRecognizer:tapPickRemove];
    
    /*[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];*/
    
}

- (void)viewWillAppear:(BOOL)animated {
    oriPoint = self.view.center;
    curPoint = oriPoint;
    willLoadToRemoveLine
    willLoadToSetThickGrayLine
}

- (void)viewWillDisappear:(BOOL)animated {
    willDisappearToAddLine
    willDisappearToRemoveThickGrayLine
}

/*
-(void)keyboardWillAppear:(NSNotification *)notification
{
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y - change ;
    //self.view.frame = currentFrame;
}

-(void)keyboardWillDisappear:(NSNotification *)notification
{
    CGRect currentFrame = self.view.frame;
    CGFloat change = [self keyboardEndingFrameHeight:[notification userInfo]];
    currentFrame.origin.y = currentFrame.origin.y + change ;
    //self.view.frame = currentFrame;
}*/

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([self.userName isFirstResponder]) {
        curPoint = oriPoint;
    } else if ([self.identityCard isFirstResponder]) {
        curPoint = oriPoint;
    } else if ([self.telephone isFirstResponder]) {
        curPoint.y = oriPoint.y - kTextFieldHeight;
    } else if ([self.postcode isFirstResponder]) {
        curPoint.y = oriPoint.y - 2 * kTextFieldHeight;
    }
    self.view.center = curPoint;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignKeyboard];
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    curPoint.y = oriPoint.y - 4 * kTextFieldHeight;
    [UIView animateWithDuration:0.2 animations:^{
        self.view.center = curPoint;
    }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [self resignKeyboard];
        return NO;
    }
    return YES;
}
/*
- (CGFloat)keyboardEndingFrameHeight:(NSDictionary *)userInfo//计算键盘的高度
{
    CGRect keyboardEndingUncorrectedFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGRect keyboardEndingFrame = [self.view convertRect:keyboardEndingUncorrectedFrame fromView:nil];
    return keyboardEndingFrame.size.height;
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAct:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pickCancelAct:(id)sender {
    [self removePickView];
}

- (void)resignKeyboard {
    [self.userName resignFirstResponder];
    [self.identityCard resignFirstResponder];
    [self.telephone resignFirstResponder];
    [self.postcode resignFirstResponder];
    [self.address resignFirstResponder];
    self.view.center = oriPoint;
}

- (IBAction)pickDoneAct:(id)sender {
    NSInteger provinceIndex = [self.pickView selectedRowInComponent: PROVINCE_COMPONENT];
    NSInteger cityIndex = [self.pickView selectedRowInComponent: CITY_COMPONENT];
    NSInteger districtIndex = [self.pickView selectedRowInComponent: DISTRICT_COMPONENT];
    
    NSString *provinceStr = [province objectAtIndex: provinceIndex];
    NSString *cityStr = [city objectAtIndex: cityIndex];
    NSString *districtStr = [district objectAtIndex:districtIndex];
    
    if ([provinceStr isEqualToString: cityStr] && [cityStr isEqualToString: districtStr]) {
        cityStr = @"";
        districtStr = @"";
    }
    else if ([cityStr isEqualToString: districtStr]) {
        districtStr = @"";
    }
    
    NSString *showMsg = [NSString stringWithFormat: @"%@ %@ %@.", provinceStr, cityStr, districtStr];
    self.localArea.text = showMsg;
    [self removePickView];
}

- (void)textViewDidChange:(UITextView *)textView {
    if (![self.address.text isEqualToString:@""]) {
        self.addrLabel.hidden = YES;
    } else {
        self.addrLabel.hidden = NO;
    }
}

- (void)removePickView {
    self.areaView.hidden = YES;
    self.pickBackView.hidden = YES;
}

- (void)showAreaView {
    self.areaView.hidden = NO;
    self.pickBackView.hidden = NO;
    [self resignKeyboard];
}

- (void)configPickView {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"area" ofType:@"plist"];
    areaDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *components = [areaDic allKeys];
    NSArray *sortedArray = [components sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableArray *provinceTmp = [[NSMutableArray alloc] init];
    for (int i=0; i<[sortedArray count]; i++) {
        NSString *index = [sortedArray objectAtIndex:i];
        NSArray *tmp = [[areaDic objectForKey: index] allKeys];
        [provinceTmp addObject: [tmp objectAtIndex:0]];
    }
    
    province = [[NSArray alloc] initWithArray: provinceTmp];
    
    NSString *index = [sortedArray objectAtIndex:0];
    NSString *selected = [province objectAtIndex:0];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [[areaDic objectForKey:index]objectForKey:selected]];
    
    NSArray *cityArray = [dic allKeys];
    NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
    city = [[NSArray alloc] initWithArray: [cityDic allKeys]];
    
    
    NSString *selectedCity = [city objectAtIndex: 0];
    district = [[NSArray alloc] initWithArray: [cityDic objectForKey: selectedCity]];
    
    selectedProvince = [province objectAtIndex: 0];
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    
}

#pragma mark- Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return [province count];
    }
    else if (component == CITY_COMPONENT) {
        return [city count];
    }
    else {
        return [district count];
    }
}


#pragma mark- Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return [province objectAtIndex: row];
    }
    else if (component == CITY_COMPONENT) {
        return [city objectAtIndex: row];
    }
    else {
        return [district objectAtIndex: row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        selectedProvince = [province objectAtIndex: row];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: [NSString stringWithFormat:@"%d", row]]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *cityArray = [dic allKeys];
        NSArray *sortedArray = [cityArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;//递减
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;//上升
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i=0; i<[sortedArray count]; i++) {
            NSString *index = [sortedArray objectAtIndex:i];
            NSArray *temp = [[dic objectForKey: index] allKeys];
            [array addObject: [temp objectAtIndex:0]];
        }
        
        city = [[NSArray alloc] initWithArray: array];
        
        NSDictionary *cityDic = [dic objectForKey: [sortedArray objectAtIndex: 0]];
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [city objectAtIndex: 0]]];
        [self.pickView selectRow: 0 inComponent: CITY_COMPONENT animated: YES];
        [self.pickView selectRow: 0 inComponent: DISTRICT_COMPONENT animated: YES];
        [self.pickView reloadComponent: CITY_COMPONENT];
        [self.pickView reloadComponent: DISTRICT_COMPONENT];
        
    }
    else if (component == CITY_COMPONENT) {
        NSString *provinceIndex = [NSString stringWithFormat: @"%d", [province indexOfObject: selectedProvince]];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: provinceIndex]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *dicKeyArray = [dic allKeys];
        NSArray *sortedArray = [dicKeyArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [sortedArray objectAtIndex: row]]];
        NSArray *cityKeyArray = [cityDic allKeys];
        
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [cityKeyArray objectAtIndex:0]]];
        [self.pickView selectRow: 0 inComponent: DISTRICT_COMPONENT animated: YES];
        [self.pickView reloadComponent: DISTRICT_COMPONENT];
    }
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return 80;
    }
    else if (component == CITY_COMPONENT) {
        return 100;
    }
    else {
        return 115;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    if (component == PROVINCE_COMPONENT) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [province objectAtIndex:row];
        //myView.font = [UIFont systemFontOfSize:15];
        myView.font = [UIFont boldSystemFontOfSize:15];
        myView.backgroundColor = [UIColor clearColor];
    }
    else if (component == CITY_COMPONENT) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 95, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [city objectAtIndex:row];
        //myView.font = [UIFont systemFontOfSize:14];
        myView.font = [UIFont boldSystemFontOfSize:15];
        myView.backgroundColor = [UIColor clearColor];
    }
    else {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 110, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [district objectAtIndex:row];
        //myView.font = [UIFont systemFontOfSize:14];
        myView.font = [UIFont boldSystemFontOfSize:15];
        myView.backgroundColor = [UIColor clearColor];
    }
    
    return myView;
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
