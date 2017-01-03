//
//  ZLCheckVersionManager.m
//  ZLCheckAppVersion
//
//  Created by apple on 2016/12/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZLCheckVersionManager.h"
#import "ViewController.h"
#import <UIKit/UIKit.h>

@implementation ZLCheckVersionManager
#ifdef DEBUG
#define ZLLog(...) NSLog(__VA_ARGS__)
#else
#define ZLLog(...)
#endif
+ (void)checkAppVersion{
    //开启线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //如果未设置AppID自动报错；
        if ([AppID isEqualToString:@""] || AppID.length == 0) {
            @throw [NSException exceptionWithName:@"HasNoAPPID" reason:@"没有设置APPID" userInfo:nil];
            return ;

        }
        //查询app最新信息的地址
        NSURL *appUrl = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/lookup?id=%@",AppID]];
        NSURLRequest *req = [[NSURLRequest alloc]initWithURL:appUrl];
        NSURLSession *session= [NSURLSession sharedSession];

        NSURLSessionTask *task = [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error) {
                ZLLog(@"请求失败");
                return ;
            }
            NSDictionary *appInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            ZLLog(@"app详细信息：%@",appInfo);
            if ([appInfo[@"results"] count] == 0) {
                ZLLog(@"为获取到版本信息");
                return;
            }
            NSDictionary *AppInfoDic = appInfo[@"results"][0];
            //版本
            NSString *versionStr = AppInfoDic[@"version"];
            ZLLog(@"版本-->%@",versionStr);
            //获取app更新模块描述，保存新的版本到本地
            NSString *updateMessage = AppInfoDic[@"releaseNotes"];
            if ([[NSUserDefaults standardUserDefaults] objectForKey:@"LocalVersion"] == nil || [[NSUserDefaults standardUserDefaults]objectForKey:@"LocalVersion"] != versionStr) {
                
                [[NSUserDefaults standardUserDefaults] setObject:versionStr forKey:@"LocalVersion"];
                [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"AppUpdate"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
            }
            if (versionStr == nil || [self getLocalVersion] == versionStr || [[NSUserDefaults standardUserDefaults] boolForKey:@"AppUpdate"]){
                return;
            }
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"新版本（%@）更新",versionStr] message:updateMessage preferredStyle:UIAlertControllerStyleAlert];
//            UIView *labelView = [self getLabelViewFromAlertVc:alert.view];
            UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"稍后更新" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            UIAlertAction *conformAction = [UIAlertAction actionWithTitle:@"前往更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSString *appStroeStr = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?l=en&mt=8", AppID];
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStroeStr]];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"AppUpdate"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }];
            NSString *alertVCTitle = [NSString stringWithFormat:@"有新版本更新\n%@",versionStr];
            NSMutableAttributedString *alertVCAttributedTitle = [self changeStrWith:alertVCTitle range:NSMakeRange(6, alertVCTitle.length - 6) strColor:[UIColor lightGrayColor] strFont:[UIFont systemFontOfSize:16]];
            //修改提示框标题字体
            [alertVC setValue:alertVCAttributedTitle forKey:@"attributedTitle"];
            [alertVC addAction:cancleAction];
            [alertVC addAction:conformAction];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIViewController *currentVc = [self activityViewController];
                //                    UIViewController *vc = [[ViewController alloc]init];
                
                [currentVc presentViewController:alertVC animated:YES completion:nil];
            });
            
            
        }];
        
        [task resume];
    });
}

/**
 获取当前系统版本
 */
+ (NSString *)getLocalVersion{
    return [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    ZLLog(@"==/===/==%@",[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]);
}

/**
 富文本编辑
 
 @param string 要编辑的字符串
 @param range 需要改变的字符串range
 @param color 字体颜色
 @param font 字体大小
 @return 修改后的字符串
 */
+ (NSMutableAttributedString *)changeStrWith:(NSString *)string
                                       range:(NSRange)range
                                    strColor:(UIColor *)color
                                     strFont:(UIFont *)font
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    [attributedString addAttribute:NSFontAttributeName value:font range:range];
    return attributedString;
}

/**
 获取当前显示的控制器
 
 @return 当前控制器
 */
+ (UIViewController *)activityViewController
{
    UIViewController* activityViewController = nil;
    //通过层级决定window的显示优先级，层级高的站前面，要注意的是这个只是改变显示的层级，真正的图层关系树并没有改变，举个栗子：
    //班里拍毕业照，按身高排了四排，班长个子高排第四排去了，但就算排在后面，他还是班长大人。
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows)
        {
            if(tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0)
    {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        
        if([nextResponder isKindOfClass:[UIViewController class]])
        {
            activityViewController = nextResponder;
        }
        else
        {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
}

@end
