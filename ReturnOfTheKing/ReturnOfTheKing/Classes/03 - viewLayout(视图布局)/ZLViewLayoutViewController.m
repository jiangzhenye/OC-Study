//
//  ZLViewLayoutViewController.m
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZLViewLayoutViewController.h"

@interface ZLViewLayoutViewController ()

@end

@implementation ZLViewLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titles = @[@"瀑布流布局",@"网易滑动标题",
                    @"滑动标题"
                    ];
    self.classNames = @[@"ZLWaterflowViewController",
                        @"ZLNeteaseHomeViewController",
                        @"YFSlideTitlesViewController"];
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
