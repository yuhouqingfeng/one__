//
//  WebViewController.h
//  one
//
//  Created by wuxinyi on 18/3/13.
//  Copyright © 2018年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (nonatomic ,strong) UIWebView * webView;

-(void) getWebViewLbaleWith: (NSString *) webStr;

@end
