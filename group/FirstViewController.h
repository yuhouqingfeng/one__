//
//  FirstViewController.h
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ONEDataModel.h"
#import "ReadListJSONModel.h"
#import <WebKit/WebKit.h>

@class ReadAuthorModel;
@class ReadContentModel;
@class ReadWeatherModel;

@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,WKNavigationDelegate>

@property (nonatomic ,strong) UITableView * tableView;

@property (nonatomic ,strong) ONEDataModel * oneDataModel;
@property (nonatomic ,strong) ReadListJSONModel *  readListModel;
@property (nonatomic ,strong) ReadWeatherModel * readWeather;
@property (nonatomic ,strong) ReadAuthorModel * readAuthor;
@property (nonatomic ,strong) ReadContentModel * readContent;

//@property (nonatomic ,strong) WKWebView * webView;

@property (nonatomic ,copy) UIImageView * headerPicture;
@property (nonatomic ,copy) UIButton * headerPraiseBtn;
@property (nonatomic ,copy) UILabel * headerPraiseLabel;
@property (nonatomic ,copy) UILabel * headerAuthorLabel;
@property (nonatomic ,copy) UILabel * headerTextLabel;
@property (nonatomic ,copy) UILabel * headerNameLabel;
@property (nonatomic ,copy) UILabel * headerFindLabel;
@property (nonatomic ,copy) UIImageView * headerFindImage;
@property (nonatomic ,copy) UIButton * headerBtn1;
@property (nonatomic ,copy) UIButton * headerBtn2;
@property (nonatomic ,copy) UIButton * headerBtn3;


@end
