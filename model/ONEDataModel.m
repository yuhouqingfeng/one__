//
//  ONEDataModel.m
//  one
//
//  Created by wuxinyi on 17/12/5.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "ONEDataModel.h"
#import "AFNetworking.h"

#define STR_read_list @"http://v3.wufazhuce.com:8000/api/onelist/idlist/?channel=wdj&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android"
#define STR_PICTURE_LIST  @"http://v3.wufazhuce.com:8000/api/hp/idlist/0?version=3.5.0&platform=android"

#define STR1 @"http://v3.wufazhuce.com:8000/api/reading/index/?version=3.5.0&platform=android"

@implementation ONEDataModel


-(void) getarticle
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_read_list parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"readArticle" object:nil userInfo:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
    
}

-(void) getarticle0:(NSString *)str
{
    NSString * STR_read = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/onelist/%@/0?channel=wdj&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android",str];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_read parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"readArticleList0" object:nil userInfo:responseObject];
//        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
}

-(void) getarticle1:(NSString *)str
{
    NSString * STR_read = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/onelist/%@/0?channel=wdj&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android",str];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_read parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"readArticleList1" object:nil userInfo:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
}

-(void) getarticle2:(NSString *)str
{
    NSString * STR_read = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/onelist/%@/0?channel=wdj&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android",str];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_read parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"readArticleList2" object:nil userInfo:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
}

-(void) getarticle3:(NSString *)str
{
    NSString * STR_read = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/onelist/%@/0?channel=wdj&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android",str];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_read parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"readArticleList3" object:nil userInfo:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
}
-(void) getarticle4:(NSString *)str
{
    NSString * STR_read = [NSString stringWithFormat:@"http://v3.wufazhuce.com:8000/api/onelist/%@/0?channel=wdj&version=4.0.2&uuid=ffffffff-a90e-706a-63f7-ccf973aae5ee&platform=android",str];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_read parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"readArticleList4" object:nil userInfo:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
}

-(void) getPictureList
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:STR_PICTURE_LIST parameters:nil progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"getPicture" object:nil userInfo:responseObject];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"-----------Error: %@", error);
    }];
}



@end
