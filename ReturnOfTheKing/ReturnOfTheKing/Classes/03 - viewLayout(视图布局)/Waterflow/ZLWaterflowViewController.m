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
#import "ZLShopCell.h"

@interface ZLWaterflowViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ZLWaterflowLayoutDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;
@end

@implementation ZLWaterflowViewController

- (NSMutableArray *)shops
{
    if (!_shops) {
        self.shops = [[NSMutableArray alloc] init];
    }
    return _shops;
}

static NSString * const CellID = @"shop";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"流水布局展示";
    
    // 初始化数据
    [self.shops addObjectsFromArray:[ZLShop objectArrayWithFilename:@"1.plist"]];
    
    // 创建布局
    ZLWaterflowLayout *layout = [[ZLWaterflowLayout alloc] init];
    layout.delegate = self;
    
    // 创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerNib:[UINib nibWithNibName:@"ZLShopCell" bundle:nil] forCellWithReuseIdentifier:CellID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    [self.view addSubview:self.collectionView];
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.shops.count;
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZLShopCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:CellID forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.row];
    return cell;
}

#pragma mark - ZLWaterflowLayoutDelegate
//不同的图片大小不同，通过shop中获取的真实的图片的w，h。再根据具体的item的宽度（确定）来计算iterm的高（非确定）。
- (CGFloat)waterflowLayout:(ZLWaterflowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itermWidth{
    
    ZLShop *shop = self.shops[indexPath.row];
    return shop.h * itermWidth / shop.w;
}


- (CGFloat)maxColumnsInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout{
    return 3;
}
- (CGFloat)rowMarginInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout{
    return 10;
}
- (UIEdgeInsets)insetsInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)columnsMarginInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout{
    return 10;
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
