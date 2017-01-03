//
//  ZLWaterflowLayout.m
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZLWaterflowLayout.h"

/**每一行的最大列数*/
static const int ZLDefaultMaxColumns = 3;
/**每一行的间距*/
static const CGFloat ZLDefaultRowMargin =10;
/**每一列的间距*/
static const CGFloat ZLDefaultColumnsMargin =10;
/**上下左右的间距*/
static const UIEdgeInsets ZLDefaultInserts = {10,10,10,10};

@interface ZLWaterflowLayout()

/**存放每一列的最大Y值（整体高度）*/
@property (nonatomic, strong) NSMutableArray *maxYs;
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end
@implementation ZLWaterflowLayout

- (NSMutableArray *)maxYs{
    if (!_maxYs) {
        _maxYs = [NSMutableArray array];
    }
    return _maxYs;
}
- (NSMutableArray *)attrsArray{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (void)prepareLayout{
    //初始化最大y值数组
    [self.maxYs removeAllObjects];
    int maxColumns = self.maxColumns;
    for (NSUInteger i =0; i < maxColumns; i++) {
        [self.maxYs addObject:@(self.insets.top)];
    }
    //计算所有cell的布局属性
    [self.attrsArray removeAllObjects];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (NSUInteger i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/**
 *  如果返回YES, 当显示的范围发生改变时就会重新刷新
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

/**
 * 返回collectionView的ContentSize
 */
- (CGSize)collectionViewContentSize{
    CGFloat longMaxY = 0;
    if (self.maxYs.count) {
        longMaxY = [self.maxYs[0] doubleValue];//最长那一列的最大值
    
        for (int i = 1; i < self.maxColumns; i++) {
            CGFloat maxY = [self.maxYs[i] doubleValue];
            if (maxY > longMaxY) {
                longMaxY = maxY;
            }
        }
        //累加底部间距
        longMaxY +=self.insets.bottom;
    }
    return CGSizeMake(0, longMaxY);
    
}
#pragma mark - 私有方法（获得代理返回的数字）
- (int)maxColumns{
    if (self.delegate respondsToSelector:@selector()) {
        <#statements#>
    }
}
- (UIEdgeInsets)insets{
    
}
@end
