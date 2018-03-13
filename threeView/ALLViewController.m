//
//  ALLViewController.m
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "ALLViewController.h"
#import "ALLViewCell.h"


#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface ALLViewController ()

@end

@implementation ALLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H-65) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = nil;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W,H*0.3)];
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, W, H*0.3);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    _scrollView.contentSize = CGSizeMake( W*9, H*0.3);
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.delegate = self;
    for(int i=0 ; i<9;i++)
    {
        NSString*  home_scro_name = [NSString stringWithFormat:@"%d.jpg",i+1];
        UIImage* home_scro_image = [UIImage imageNamed:home_scro_name];
        UIImageView*  home_scro_view = [[UIImageView alloc] initWithImage:home_scro_image];
        home_scro_view.frame = CGRectMake(W*i, 0, W, H*0.3);
        [_scrollView addSubview:home_scro_view];
    }
    [_tableView.tableHeaderView addSubview:_scrollView];
    
    //
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(W*0.3,20 ,W*0.6,20 )];
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = 9;
    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [_pageControl addTarget:self action:@selector(PageOn:) forControlEvents:UIControlEventValueChanged ];
    [_tableView.tableHeaderView addSubview:_pageControl];
    
    [self addTimer];
    
    self.oneDataModel  = [[ONEDataModel alloc] init];
    [self.oneDataModel getPictureList];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getPicture:) name:@"getPicture" object:nil];
}

-(void) getPicture:(NSNotification *) notification
{
    _pictureDataArray = notification.userInfo[@"data"];
//    NSLog(@"%@",_pictureDataArray);
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * str = @"cell";
    ALLViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil)
    {
        cell = [[ALLViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    return cell;
    
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}

-(void) PageOn:(UIPageControl *) p
{
    _scrollView.contentOffset = CGPointMake(W*p.currentPage, 0);
    
}
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger number = (_scrollView.contentOffset.x + _scrollView.frame.size.width/2 ) / _scrollView.frame.size.width;
    _pageControl.currentPage = number;
}

-(void) addTimer
{
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(press_nextpage) userInfo:nil repeats:YES];
    self.timer = timer;
    
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    [mainLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void) press_nextpage
{
    NSInteger page = (NSInteger)_pageControl.currentPage;
    if (page == 8) {
        page = 0;
    }
    else{
        page++;
    }
    CGFloat x = page * _scrollView.frame.size.width;
    _pageControl.currentPage = page;
    
    _scrollView.contentOffset = CGPointMake(x, 0);
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
