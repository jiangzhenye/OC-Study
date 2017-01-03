//
//  ZLShopCell.m
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZLShopCell.h"
#import "UIImageView+WebCache.h"

@interface ZLShopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ZLShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setShop:(ZLShop *)shop{
    _shop = shop;
    self.priceLabel.text = shop.price;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];
}

@end
