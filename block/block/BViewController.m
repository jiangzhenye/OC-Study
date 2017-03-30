//
//  BViewController.m
//  block
//
//  Created by apple on 2017/1/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    [self.view addSubview:_textField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    self.callBackBlock(_textField.text); //1
    [self.navigationController popToRootViewControllerAnimated:YES];
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
