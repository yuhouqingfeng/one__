//
//  ONEViewController.h
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

#import "ONEDataModel.h"

@interface ONEViewController : UIViewController<UIScrollViewDelegate>

@property(nonatomic ,strong) UIScrollView * scrollView;
@property(nonatomic ,strong) UIPageControl * pageControl;

@property(nonatomic ,strong) FirstViewController * firstViewController;
@property(nonatomic ,strong) SecondViewController * secondViewController;
@property(nonatomic ,strong) ThirdViewController * thirdViewController;
@property(nonatomic ,strong) FourthViewController * fourthViewController;
@property(nonatomic ,strong) FifthViewController * fifthViewController;

@property (nonatomic ,strong) NSDictionary * dictionary;
@property (nonatomic ,copy) NSArray * readArray;
@property (nonatomic ,strong) NSMutableArray * titleArray;

@property (nonatomic ,strong) ONEDataModel * oneDataModel;
@property (nonatomic ,strong) ReadListJSONModel *  readListModel;
@property (nonatomic ,strong) ReadContentModel * readContent;

@end
