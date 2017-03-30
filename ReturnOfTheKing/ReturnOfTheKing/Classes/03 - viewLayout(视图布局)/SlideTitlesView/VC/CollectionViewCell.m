
//
//  CollectionViewCell.m
//  CollectionView-PureCode
//
//  Created by chenyufeng on 15/10/30.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "CollectionViewCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)

@interface CollectionViewCell ()
@property(nonatomic,strong) UITapGestureRecognizer *singletap;
@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
      self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
      self.imageView.image = [UIImage imageNamed:@"视频"];
      self.imageView.backgroundColor = [UIColor blueColor];
      self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
      self.selectBtn.frame = CGRectMake(self.frame.size.width - 20, self.frame.size.height- 20, 20, 20);
      [self.selectBtn setImage:[UIImage imageNamed:@"img_photo_select"] forState:UIControlStateSelected];
      [self.selectBtn setImage:[UIImage imageNamed:@"img_security_ball"] forState:UIControlStateNormal];
      _singletap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
      [self.imageView addGestureRecognizer:_singletap];

      [self.imageView setUserInteractionEnabled:true];
      [self addSubview:self.imageView];
      [self addSubview:self.selectBtn];
    self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (SCREEN_WIDTH - 80) / 2, (SCREEN_WIDTH - 80) / 2, 35)];
    self.descLabel.textAlignment = NSTextAlignmentCenter;
      self.descLabel.numberOfLines = 0;
      self.descLabel.textColor = [UIColor whiteColor];
      self.descLabel.font = [UIFont systemFontOfSize: 12.0];
    [self addSubview:self.descLabel];
  }
  return self;
}

//单击手势
- (void) handleSingleTap:(UITapGestureRecognizer *) gestureRecognizer
{
    [self.delegate playVideoAtIndexpath:_path];
}
//-(void)ChangeNameNotification:(NSNotification*)notification{
////    [self.imageView removeGestureRecognizer:_singletap];
////    [self.imageView remove];
//    [self.imageView setUserInteractionEnabled:NO];
//    NSDictionary *nameDictionary = [notification userInfo];
//    if ([nameDictionary[@"title"] isEqualToString:@"取消"]) {
//        [self.imageView setUserInteractionEnabled:YES];
//    }
//}
@end
