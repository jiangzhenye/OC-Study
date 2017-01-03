//
//  ZLCheckVersionManager.h
//  ZLCheckAppVersion
//
//  Created by apple on 2016/12/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
//打开iTuens找到苹果商店的App然后拷贝链接，ID即为1092452179
//例：https://itunes.apple.com/us/app/sheng-huo-zong-tai-ke-hu-duan/id1092452179?mt=8
static const NSString *AppID = @"1092452179";
@interface ZLCheckVersionManager : NSObject

/*检查新版本*/
+ (void)checkAppVersion;
@end
