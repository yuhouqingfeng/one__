//
//  ONEViewController.m
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "ONEViewController.h"
#import "ONEJSONModel.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@class AuthorModel;
@class EssayModel;
@interface ONEViewController ()
@property (nonatomic ,assign) NSInteger number;
@property (nonatomic ,assign) NSInteger sum;
@end

@implementation ONEViewController

- (void)viewDidLoad {
    [super viewDidLoad];  _sum = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    self.firstViewController = [[FirstViewController alloc] init];
    self.secondViewController = [[SecondViewController alloc] init];
    self.thirdViewController = [[ThirdViewController alloc] init];
    self.fourthViewController = [[FourthViewController alloc] init];
    self.fifthViewController = [[FifthViewController alloc] init];
    
    [self addChildViewController:_firstViewController ];
    [self addChildViewController:_secondViewController];
    [self addChildViewController:_thirdViewController ];
    [self addChildViewController: _fourthViewController ];
    [self addChildViewController: _fifthViewController ];
    
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0,W, H-65);
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.alwaysBounceHorizontal = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.directionalLockEnabled = YES;//横向和纵向不同时运动
    _scrollView.contentSize = CGSizeMake(7*W, H-65);
    _scrollView.delegate = self;
    [_scrollView scrollRectToVisible:CGRectMake(W, 0, W, H-65) animated:NO];
    NSArray * array =[NSArray arrayWithObjects:_firstViewController.view, _secondViewController.view,_thirdViewController.view,_fourthViewController.view,_fifthViewController.view, nil];
    for(int i=0;i<5;i++)
    {
        UIView *view = [array objectAtIndex:i];
        view.frame = CGRectMake(W*(i+1), 0, W, H-65);
        [_scrollView addSubview:view];
    }
    [self.view addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(10, 20 , 300, 10) ];
    _pageControl.backgroundColor = [UIColor blackColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.numberOfPages = 7;
    _pageControl.currentPage = 1;
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [_pageControl addTarget:self action:@selector(pressPage:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview: _pageControl];
    
    self.oneDataModel = [[ONEDataModel alloc] init];
    [_oneDataModel getarticle];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(readArticle:) name:@"readArticle" object:nil];
   
}
- (void)readArticle:(NSNotification *)notification
{
    _readArray = notification.userInfo[@"data"];NSLog(@"====%@",_titleArray[0]);
    [_oneDataModel getarticle0:_readArray[0]];
    [_oneDataModel getarticle1:_readArray[1]];
    [_oneDataModel getarticle2:_readArray[2]];
    [_oneDataModel getarticle3:_readArray[3]];
    [_oneDataModel getarticle4:_readArray[4]];
//    _titleArray = [[NSMutableArray alloc] initWithObjects: _firstViewController.readContent.post_date,_secondViewController.readContent.post_date,_thirdViewController.readContent.post_date,_fourthViewController.readContent.post_date,_fifthViewController.readContent.post_date, nil];
//    NSLog(@"====%@",_titleArray);
//    ONEJSONModel * onejsonmodel = [[ONEJSONModel alloc] initWithDictionary:_dictionary error:nil];
//    EssayModel * essay = [[EssayModel alloc] init];
//    AuthorModel * author_list = [[AuthorModel alloc] init];
//    essay = onejsonmodel.essay[0];
//    author_list = essay.author_list[0];
//    NSLog( @"%@",essay);
//    
//    NSLog(@"******%@",author_list);
}
-(void) pressPage:(UIPageControl *) p
{
    if(p.currentPage == 6)
        p.currentPage = 1;
    if(p.currentPage == 0)
        p.currentPage = 5;
    _pageControl.currentPage = p.currentPage;
    _scrollView.contentOffset = CGPointMake(p.currentPage * W, 0);
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _number = (_scrollView.contentOffset.x + _scrollView.frame.size.width/2 ) / _scrollView.frame.size.width;
    if(_number == 6 && _sum==0)
    {_number = 1;  _sum++;
        [_oneDataModel getarticle0:_readArray[0+_sum*5]];
        [_oneDataModel getarticle1:_readArray[1+_sum*5]];
        [_oneDataModel getarticle2:_readArray[2+_sum*5]];
        [_oneDataModel getarticle3:_readArray[3+_sum*5]];
        [_oneDataModel getarticle4:_readArray[4+_sum*5]];
    }
    if(_number == 0 && _sum == 1)
    {_number = 5;  _sum--;
        [_oneDataModel getarticle0:_readArray[0+_sum*5]];
        [_oneDataModel getarticle1:_readArray[1+_sum*5]];
        [_oneDataModel getarticle2:_readArray[2+_sum*5]];
        [_oneDataModel getarticle3:_readArray[3+_sum*5]];
        [_oneDataModel getarticle4:_readArray[4+_sum*5]];
    }
    if(_number == 0 && _sum == 0)
        _number = 1;
    if(_number == 6 && _sum == 1)
        _number = 5;
    _pageControl.currentPage = _number;
    _scrollView.contentOffset = CGPointMake(_pageControl.currentPage * W, 0);
    
    //    _titleArray = [[NSMutableArray alloc] initWithObjects: _firstViewController.readContent.post_date,_secondViewController.readContent.post_date,_thirdViewController.readContent.post_date,_fourthViewController.readContent.post_date,_fifthViewController.readContent.post_date, @"",nil];
    //    self.navigationItem.title = [[_titleArray objectAtIndex:_number-1] substringWithRange:NSMakeRange(0, 10) ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
   
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
