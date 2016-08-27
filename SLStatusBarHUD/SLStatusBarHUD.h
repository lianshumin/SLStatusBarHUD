//
//  SLStatusBarHUD.h
//  SLStatusBarHUD
//
//  Created by 连书敏 on 16/8/26.
//  Copyright © 2016年 连书敏. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SLStatusBarHUD : NSObject

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示普通文字
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示正在加载信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
