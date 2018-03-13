//
//  FirstViewController.m
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "FirstViewController.h"
#import "ONEViewCell.h"
#import "AUTOONEcell.h"
#import "HandleViewCell.h"
#import "WebViewController.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface FirstViewController ()
{
    CGSize  labelHeight;
    CGSize  headerHeight;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, W, H-65);
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H-110) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(readArticleList0:) name:@"readArticleList0" object:nil];
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, W,H-65)];
    _headerPicture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, W, H*0.6)];
    _headerPraiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _headerPraiseBtn.frame = CGRectMake(W*0.7, H*0.55, 40, 20);
    [_headerPraiseBtn setImage:[UIImage imageNamed:@"praise1.png"] forState:UIControlStateNormal];
    _headerPraiseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.8*W, H*0.55, 60, 20) ];
    _headerPraiseLabel.textColor = [UIColor whiteColor];
    _headerAuthorLabel = [[UILabel alloc] initWithFrame:CGRectMake(W*0.4, H*0.6+10, W*0.2, 20) ];
    _headerTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _headerTextLabel.numberOfLines = 0 ;
    _headerNameLabel = [[UILabel alloc] init];
    _headerFindLabel = [[UILabel alloc] init];
    _headerFindLabel.text = @"发现";
    _headerFindImage = [[UIImageView alloc] init];
    _headerFindImage.image = [UIImage imageNamed:@"btn3.png"];
    
    _headerBtn1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headerBtn1 setImage:[UIImage imageNamed:@"btn1.png"] forState:UIControlStateNormal];
    _headerBtn2  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headerBtn2 setImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateNormal];
    _headerBtn3  = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headerBtn3 setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    
    [_tableView.tableHeaderView addSubview:_headerPicture];
    [_tableView.tableHeaderView addSubview:_headerPraiseBtn];
    [_tableView.tableHeaderView addSubview:_headerPraiseLabel];
    [_tableView.tableHeaderView addSubview:_headerAuthorLabel];
    [_tableView.tableHeaderView addSubview:_headerTextLabel];
    [_tableView.tableHeaderView addSubview:_headerNameLabel];
    [_tableView.tableHeaderView addSubview:_headerFindLabel];
    [_tableView.tableHeaderView addSubview:_headerFindImage];
    [_tableView.tableHeaderView addSubview:_headerBtn1];
    [_tableView.tableHeaderView addSubview:_headerBtn2];
    [_tableView.tableHeaderView addSubview:_headerBtn3];

    
    [self.view addSubview:_tableView];
   
    
}
-(void) readArticleList0:(NSNotification *)notification
{
 
    NSDictionary * dict = notification.userInfo[@"data"];
    self.readListModel = [[ReadListJSONModel alloc] initWithDictionary:dict error:nil];
    _readWeather = [[ReadWeatherModel alloc] init];
    _readAuthor = [[ReadAuthorModel alloc] init];
    _readContent = [[ReadContentModel alloc] init];
     [self.tableView reloadData];
    
    _readContent = _readListModel.content_list[0];
    NSLog(@"+++++++++++++%@",_readContent.share_url);
    _readAuthor = _readContent.author;
    
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:_readContent.img_url] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        dispatch_async(dispatch_get_main_queue(), ^{
            _headerPicture.image = image;
        });
    }];
    [downloadTask resume];
    
    _headerPraiseLabel.text = _readContent.like_count;
    _headerAuthorLabel.text = _readAuthor.user_name;
    _headerTextLabel.text = _readContent.forward;
    _headerNameLabel.text = _readContent.title;
    
    AUTOONEcell * autolabel = [[AUTOONEcell alloc] init];
    headerHeight = [autolabel getlableWith:_readContent.forward];
    _headerTextLabel.frame  = CGRectMake(40, H*0.6+40, headerHeight.width, headerHeight.height); _headerTextLabel.font = [UIFont systemFontOfSize:15];
    _headerNameLabel.frame = CGRectMake(W*0.4, H*0.6+50+headerHeight.height, W*0.2, 20);
    _headerFindLabel.frame = CGRectMake(50, H*0.6+80+headerHeight.height, 40, 20);
    _headerFindImage.frame = CGRectMake(25, H*0.6+80+headerHeight.height, 20, 20);
    
    _headerBtn1.frame = CGRectMake(W*0.7, H*0.6+80+headerHeight.height, 25, 25);
    _headerBtn2.frame = CGRectMake(W*0.8, H*0.6+80+headerHeight.height, 25, 25);
    _headerBtn3.frame = CGRectMake(W*0.9, H*0.6+80+headerHeight.height, 25, 25);
    //自适应高度
    UIView * view = _tableView.tableHeaderView;
    view.frame = CGRectMake(0, 0, W, H*0.6+110+headerHeight.height);
    _tableView.tableHeaderView = view;
    
//    self.tableView.dataSource = self;
   
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* str1 = @"cell1";
    NSString* str2 = @"cell2";
    _readContent = _readListModel.content_list[indexPath.section];
    _readAuthor = _readContent.author;
    _readWeather = _readListModel.weather;

    if(indexPath.section == 0)
    {
        HandleViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:str1];
        if(cell == nil)
        {
            cell = [[HandleViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str1];
        }
        cell.textlabel.text = @"一个VOL.1891";
        self.tableView.dataSource = self;
        return cell;
    }
    else
    {
        ONEViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:str2];
        if(cell == nil)
        {
            cell = [[ONEViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str2];
        }
        cell.titleLabel.text = _readContent.title;
//        cell.titleLabel.text = _readContent.share_url;
        cell.personLabel.text = _readAuthor.user_name;
        cell.articleLabel.text = _readContent.forward;
        cell.praiseLable.text = _readContent.like_count;
        if([_readContent.post_date rangeOfString:_readWeather.date].location != NSNotFound)
            cell.dayLabel.text = @"今天";
        else
        {
            NSString * dayString = [_readContent.post_date  substringWithRange:NSMakeRange(5, 5)];
            cell.dayLabel.text = dayString;
        }
//        NSMutableArray *    themearray = [[NSMutableArray alloc] initWithObjects:@"",@"ONE STORY",@"一周语文",@"问答",@"音乐",@"影视", nil ];
//        cell.themeLabel.text = [themearray objectAtIndex:indexPath.section];
        AUTOONEcell * autocell = [[AUTOONEcell alloc] init];
        labelHeight = [autocell getlableheightWith:_readContent.forward];
        cell.articleLabel.frame = CGRectMake(20, 140+H*0.3, labelHeight.width , labelHeight.height);
        cell.dayLabel.frame = CGRectMake(20, 150+H*0.3+labelHeight.height, 80, 30);
        cell.praiseBtn.frame = CGRectMake(W*0.65, 150+H*0.3+labelHeight.height, 30, 30);
        cell.praiseLable.frame = CGRectMake(W*0.65+30, 150+H*0.3+labelHeight.height, 50, 20);
       cell.shareBtn.frame = CGRectMake(W*0.7+70, 150+H*0.3+labelHeight.height, 30, 30);
    
        //1.创建会话
        NSURLSession* session = [NSURLSession sharedSession];
        //2.根据会话创建任务
        NSURLSessionDownloadTask* downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:_readContent.img_url] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            UIImage* image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.pictureImage.image = image;
            });
            
        }];
        [downloadTask resume];
        return cell;
    }
    
    return nil;
    
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _readListModel.content_list.count;
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
    if(indexPath.section == 0)
        return  40;
    else
        return  180+H*0.3+labelHeight.height;
}
//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(indexPath.section == 2)
//    {
//        NSString * url1 = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/essay/%@?channel=wdj&source=summary&source_id=9261&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android",_readContent.item_id];
//        NSLog(@"****************%@",_readContent.item_id);
//        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, W, H-65)];
//        _webView.scrollView.backgroundColor = [UIColor whiteColor];
//        _webView.navigationDelegate = self;
//        [self.view addSubview:_webView];
//        
//        NSURL * url = [NSURL URLWithString:url1];
//        [_webView  loadRequest:[NSURLRequest requestWithURL:url]];
//    }
//}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( indexPath.section != 0) {
        WebViewController * webView = [[WebViewController alloc] init];
        _readContent = _readListModel.content_list[indexPath.section];
        [webView getWebViewLbaleWith:_readContent.share_url];
        webView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:webView animated:YES];
        //dfghetyujtyjtyhj
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
