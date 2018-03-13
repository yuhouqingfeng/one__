//
//  ALLViewController.h
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ONEDataModel.h"

@interface ALLViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property(nonatomic ,strong) UITableView * tableView;
@property(nonatomic ,strong) UIPageControl * pageControl;
@property(nonatomic ,retain) NSTimer * timer;
@property(nonatomic ,strong) UIScrollView * scrollView;

@property (nonatomic ,strong) ONEDataModel * oneDataModel ;
@property (nonatomic ,strong) NSMutableArray * pictureDataArray;

@end
