//
//  ZLKeepViewController.m
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/4.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZLKeepViewController.h"
#import "ZLIntroductionViewController.h"

@interface ZLKeepViewController ()
@property (nonatomic, strong) ZLIntroductionViewController *introductionView;
@end

@implementation ZLKeepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    
    self.introductionView = [[ZLIntroductionViewController alloc]initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames];
    [self.view addSubview:self.introductionView.view];
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
