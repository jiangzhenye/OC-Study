//
//  ZLWaterflowViewController.m
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZLWaterflowViewController.h"
#import "ZLShop.h"
#import "MJExtension.h"
#import "ZLWaterflowLayout.h"

@interface ZLWaterflowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ZLWaterflowLayoutDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;
@end

@implementation ZLWaterflowViewController

- (NSMutableArray *)shop{
    if (!_shops) {
        _shops = [NSMutableArray array];
    }
    return _shops;
}
static NSString * const CellID = @"shop";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"流水布局展示";
    //初始化数据
    [self.shops addObjectsFromArray:[ZLShop objectArrayWithFilename:@"1.plist"]];
    
    //创建布局
    ZLWaterflowLayout *layout = [[ZLWaterflowLayout alloc] init];
    layout.delegate = self;
    
    //创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerNib:[UINib nibWithNibName:@"ZLShopCell" bundle:nil] forCellWithReuseIdentifier:CellID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
