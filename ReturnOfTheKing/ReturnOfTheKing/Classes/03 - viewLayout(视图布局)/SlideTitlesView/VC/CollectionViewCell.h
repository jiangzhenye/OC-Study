//
//  CollectionViewCell.h
//  CollectionView-PureCode
//
//  Created by chenyufeng on 15/10/30.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CollectionViewCellDelegate <NSObject>

-(void)deleteCellAtIndexpath:(NSIndexPath *)path;
-(void)playVideoAtIndexpath:(NSIndexPath *)indexPath;

@end

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic,weak) id<CollectionViewCellDelegate>delegate;

@property(strong,nonatomic) UIImageView *imageView;
@property(strong,nonatomic) UIButton *selectBtn;
@property(strong,nonatomic) UILabel *descLabel;
@property(nonatomic,strong)NSIndexPath *path;
@end
