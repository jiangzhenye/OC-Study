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
/**
  *第一次加载layout、刷新layout、以及- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;这个方法返回yes时，会调用
 */
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
/**
 *  indexPath这个位置对应cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    //每一列的间距
    CGFloat columnMargin = self.columnMargin;
    //每一行的间距
    CGFloat rowMargin = self.rowMargin;
    //CollectionView的尺寸
    CGFloat collectionW = self.collectionView.bounds.size.width;
    //最大列数
    int maxColumn = self.maxColumns;
    //间距
    UIEdgeInsets insets = self.insets;
    // item(cell)的宽度
    CGFloat itemW = (collectionW - insets.left - insets.right - columnMargin * (maxColumn - 1)) / maxColumn;
    //item的高度（询问代理）
    CGFloat itemH = [self.delegate waterflowLayout:self heightForItemAtIndexPath:indexPath itemWidth:itemW];
    //创建属性
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //设置位置和尺寸
    CGFloat minColumnMaxY = [self.maxYs[0] doubleValue];//假定第0列为所有列中最短的那一列，得到其y值
    NSUInteger minColumn = 0;//最短那一列的列号为0
    for (NSUInteger i = 1; i < maxColumn; i++) {//找出三列中最短的那一列
        CGFloat maxY = [self.maxYs[i] doubleValue];
        if (maxY < minColumnMaxY) {//说明找到了第i列的y值比第0列的要短
            minColumnMaxY = maxY;
            minColumn = i;//得到最短列的列号。
        }
    }
    //要添加的item的xy位置
    CGFloat itemX = insets.left + minColumn * (itemW + columnMargin);
    CGFloat itemY = minColumnMaxY + rowMargin;
    
    attr.frame = CGRectMake(itemX, itemY, itemW, itemH);
    //累加这一列的最大值
    self.maxYs[minColumn] = @(CGRectGetMaxY(attr.frame));
    return attr;
    
}
/**
 * 返回collectionView视图中所有视图的属性(UICollectionViewLayoutAttributes)数组
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}
#pragma mark - 私有方法（获得代理返回的数字）

- (int)maxColumns{
    if ([self.delegate respondsToSelector:@selector(maxColumnsInWaterflowLayout:)]) {
        return [self.delegate maxColumnsInWaterflowLayout:self];
    }
    return ZLDefaultMaxColumns;
}

- (CGFloat)columnMargin{
    if ([self.delegate respondsToSelector:@selector(columnsMarginInWaterflowLayout:)]) {
        return [self.delegate columnsMarginInWaterflowLayout:self];
    }
    return ZLDefaultColumnsMargin;
}

- (CGFloat)rowMargin{
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterflowLayout:)]) {
        return [self.delegate rowMarginInWaterflowLayout:self];
    }
    return ZLDefaultRowMargin;
}

- (UIEdgeInsets)insets{
    if ([self.delegate respondsToSelector:@selector(insetsInWaterflowLayout:)]) {
        return [self.delegate insetsInWaterflowLayout:self];
    }
    return ZLDefaultInserts;
}
@end
