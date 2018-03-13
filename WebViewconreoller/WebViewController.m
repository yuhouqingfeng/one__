//
//  WebViewController.m
//  one
//
//  Created by wuxinyi on 18/3/13.
//  Copyright © 2018年 wuxinyi. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem  *  personal_return = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img.png"] style:UIBarButtonItemStylePlain target:self action:@selector(press_return)];
    self.navigationItem.leftBarButtonItem = personal_return;
    
    
    // Do any additional setup after loading the view.
}
-(void) getWebViewLbaleWith: (NSString *) webStr
{
    NSLog(@"666666666666%@",webStr);
    CGRect bounds = [UIScreen mainScreen].bounds;
    _webView = [[UIWebView alloc]initWithFrame:bounds];
    [self.view addSubview:_webView];
    _webView.scalesPageToFit = YES;
    NSURL * url = [NSURL URLWithString:webStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
-(void) press_return
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
