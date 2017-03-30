//
//  ZLIntroductionViewController.h
//  ReturnOfTheKing
//
//  Created by apple on 2017/1/4.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLIntroductionViewController : UIViewController


@property (nonatomic, strong) UIScrollView *pagingScrollView;
@property (nonatomic, strong) UIButton *enterBtn;
//@property (nonatomic, copy) <#type#> *<#name#>;
@property (nonatomic, strong) NSArray *backgroundImageNames;
@property (nonatomic, strong) NSArray *coverImageNames;
- (instancetype)initWithCoverImageNames:(NSArray *)coverNames backgroundImageNames:(NSArray *)bgNames;

@end
