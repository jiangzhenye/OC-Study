//
//  ViewController.m
//  block
//
//  Created by apple on 2017/1/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "BViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _btn.backgroundColor = [UIColor blueColor];
    [_btn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}
- (void)Click{
    BViewController *bVC = [[BViewController alloc]init];
    bVC.callBackBlock = ^(NSString *text){   // 1
        
        NSLog(@"text is %@",text);
        
        
    };
    [self presentViewController:bVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
