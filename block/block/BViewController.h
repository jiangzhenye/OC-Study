//
//  BViewController.h
//  block
//
//  Created by apple on 2017/1/6.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CallBackBlcok) (NSString *text);//1
@interface BViewController : UIViewController

@property (nonatomic,copy)CallBackBlcok callBackBlock;//2
@end
