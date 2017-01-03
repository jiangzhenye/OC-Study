//
//  ZLWaterflowLayout.h
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZLWaterflowLayout;
@protocol ZLWaterflowLayoutDelegate <NSObject>

- (CGFloat)waterflowLayout:(ZLWaterflowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itermWidth;
@optional
/**
 * 返回四边的间距，默认是UIEdgeInsertsMake(10, 10, 10, 10)
 */
- (UIEdgeInsets)insetsInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout;
/**
 * 返回最大列数
 */
- (CGFloat)maxColumnsInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout;
/**
 * 返回每行之间的间距10
 */
- (CGFloat)rowMarginInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout;
/**
 * 返回每列的间距默认是10
 */
- (CGFloat)columnsInWaterflowLayout:(ZLWaterflowLayout *)waterflowLayout;

@end
@interface ZLWaterflowLayout : UICollectionViewLayout
@property (nonatomic,weak) id<ZLWaterflowLayoutDelegate>delegate;
@end
