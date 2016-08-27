//
//  ViewController.m
//  SLStatusBarHUDExample
//
//  Created by 连书敏 on 16/8/27.
//  Copyright © 2016年 连书敏. All rights reserved.
//

#import "ViewController.h"
#import "SLStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success:(id)sender {
    
    [SLStatusBarHUD showSuccess:@"加载成功"];
    
}
- (IBAction)error:(id)sender {
    
    [SLStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    
    [SLStatusBarHUD showLoading:@"正在加载中..."];
}
- (IBAction)hidden:(id)sender {
    
    [SLStatusBarHUD hide];
}

- (IBAction)message:(id)sender {
    
    [SLStatusBarHUD showMessage:@"abc..."];
}
@end
