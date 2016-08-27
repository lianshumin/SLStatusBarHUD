//
//  SLStatusBarHUD.m
//  SLStatusBarHUD
//
//  Created by 连书敏 on 16/8/26.
//  Copyright © 2016年 连书敏. All rights reserved.
//

#import "SLStatusBarHUD.h"

#define SLMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat const SLMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const SLAnimationDuration = 0.25;

@implementation SLStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

/**
 *  显示窗口
 */
+ (void)showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES; // 去残影
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blueColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:SLAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息
 *
 *  @param msg   文字
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image {
    
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = SLMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:SLMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


/**
 *  显示普通文字
 */
+ (void)showMessage:(NSString *)msg{
   
    [self showMessage:msg image:nil];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg{
    
    NSLog(@"%@", NSTemporaryDirectory());
    [self showMessage:msg image:[UIImage imageNamed:@"SLStatusBarHUD.bundle/check_green"]];
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg{

    [self showMessage:msg image:[UIImage imageNamed:@"SLStatusBarHUD.bundle/close_red"]];

}

/**
 *  显示正在加载信息
 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = SLMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : SLMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}


/**
 * 隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:SLAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height; // - window_.frame.size.height
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
