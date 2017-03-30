//
//  YFSlideTitlesViewController.m
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 3/7/16.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "YFSlideTitlesViewController.h"

#import "WSFSlideTitlesView.h"
#import "CollectionViewCell.h"

@interface YFSlideTitlesViewController () <WSFSlideTitlesViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) CollectionViewCell *cell;
@property (nonatomic, weak) WSFSlideTitlesView *titlesView;
@property (nonatomic, strong) NSMutableArray *videoDateArray;

@end

@implementation YFSlideTitlesViewController
- (NSArray *)videoDateArray{
    if (_videoDateArray) {
        _videoDateArray = [NSMutableArray array];
    }
    return _videoDateArray;
}
static NSString *cellID = @"Emergency";
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //创建collectionView
    [self creatCollectionView];
    // 创建 WSFSlideTitlesView
    [self createWSFSlideTitlesView];
    
    // 临时创建一个按钮修改选中按钮
//    [self createSelectButton];
    
}

- (void)createWSFSlideTitlesView
{
    // 创建设置，最少需要内容和尺寸
    // 其他样式自定义可查看 setting 头文件
    WSFSlideTitlesViewSetting *titlesSetting = [[WSFSlideTitlesViewSetting alloc] init];
    titlesSetting.titlesArr = @[ @"紧急", @"监控", @"行车", @"本地"];
    titlesSetting.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30);
    
    // 通过设置创建 WSFSlideTitlesView
    WSFSlideTitlesView *titlesView = [[WSFSlideTitlesView alloc] initWithSetting:titlesSetting];
    titlesView.delegate = self;
    self.titlesView = titlesView;
    [self.view addSubview:titlesView];
}
- (void)creatCollectionView{
    self.view.backgroundColor = ZLGlobalBg;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ZLScreenWidth, ZLScreenHeight) collectionViewLayout:flowLayout];
    //设置Cell多选
    self.collectionView.allowsMultipleSelection = YES;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellID];
    self.collectionView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    self.collectionView.backgroundColor = ZLGlobalBg;
    [self.view addSubview:self.collectionView];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
}
- (void)createSelectButton
{
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [selectButton setTitle:@"点击 跳转第0个按钮" forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(selectButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [selectButton sizeToFit];
    selectButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    
    [self.view addSubview:selectButton];
}

- (void)selectButtonClick
{
    // 在外部控制内部选中按钮，传入 index 即可
    [self.titlesView selectButtonAtIndex:0];
}

#pragma mark - WSFSlideTitlesViewDelegate
- (void)slideTitlesView:(WSFSlideTitlesView *)titlesView didSelectButton:(UIButton *)button atIndex:(NSUInteger)index
{
    // 选中按钮切换通知外部
    NSLog(@"点击 -第%zd个- -%@- 按钮", index, [button attributedTitleForState:UIControlStateNormal].string);
    NSArray *arr = @[@"d",@"d",@"s",@"d",@"s",@"sa"];
    NSArray *arr1 = @[@"s",@"d",@"s",@"sa"];
    NSArray *arr2 = @[@"d",@"s",@"d",@"s",@"sa"];
    NSArray *arr3 = @[@"s",@"sa"];
    switch (index) {
            //刷新数据
        case 0:
            [self.videoDateArray addObject:arr];
            [self.collectionView reloadData];
            break;
        case 1:
            
            [self.videoDateArray addObject:arr1];
            [self.collectionView reloadData];
            break;
        case 2:
            
            [self.videoDateArray addObject:arr2];
            [self.collectionView reloadData];
            break;
        case 3:
            
            [self.videoDateArray addObject:arr3];
            [self.collectionView reloadData];
            break;
            
        default:
            break;
    }
    
    
}


#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    _cell.backgroundColor = [UIColor redColor];

    _cell.userInteractionEnabled =YES;
    
    
    return _cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((ZLScreenWidth - 15) / 3, (ZLScreenWidth - 15) / 3);
}
//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}


@end


