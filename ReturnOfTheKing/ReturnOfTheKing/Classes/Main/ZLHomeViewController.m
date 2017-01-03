//
//  ZLHomeViewController.m
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZLHomeViewController.h"

@interface ZLHomeViewController ()

@end

@implementation ZLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[@"按钮",
                    @"标签",
                    @"视图布局",
                    @"视图切换",
                    @"视图效果",
                    @"文字视图",
                    @"零散知识点",
                    @"小项目展示",
                    @"动画集合",
                    @"UIKit",
                    @"仿主流app功能",
                    @"设计模式",
                    @"常用工具类",
                    @"数据持久化",
                    @"网络请求",
                    @"博客/论坛",
                    @"算法"];
    //框架模式有哪些？
    //MVC、MTV、MVP、CBD、ORM等等；

    self.classNames = @[@"ZLButtonViewController",
                        @"ZLLabelViewController",
                        @"ZLViewLayoutViewController",
                        @"ZLViewTransitionViewController",
                        @"ZLViewEffectsViewController",
                        @"ZLTextViewViewController",
                        @"ZLKnowledgePointViewController",
                        @"ZLLittleProjectViewController",
                        @"ZLAnimationsViewController",
                        @"ZLUikitViewController",
                        @"ZLImitateAppViewController",
                        @"ZLDesignPatternViewController",
                        @"ZLToolsViewController",
                        @"ZLDataPersistenceViewController",
                        @"ZLNetworkViewController",
                        @"ZLBlogViewController",
                        @"ZLAlgorithmViewController"];
    
    [self setupNav];
}
#pragma mark - private
- (void)setupNav{
    self.title = @"目录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"作者" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
}
- (void)rightButtonClick{
    ZLLog(@"we");
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
