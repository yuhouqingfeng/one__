//
//  ONEJSONModel.h
//  one
//
//  Created by wuxinyi on 17/12/5.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface AuthorModel : JSONModel

@property (nonatomic ,copy) NSString * desc;
@property (nonatomic ,assign) float fans_total;
@property (nonatomic ,assign) float is_settled;
@property (nonatomic ,copy) NSString * user_name;
@property (nonatomic ,copy) NSString * web_url;
@property (nonatomic ,assign) float user_id;

@end

@protocol AuthorModel;
@interface EssayModel : JSONModel

@property (nonatomic ,copy) NSArray<AuthorModel> * author;
@property (nonatomic ,assign) float content_id;
@property (nonatomic ,copy) NSString * guide_word;
@property (nonatomic ,copy) NSString * share_url;
@property (nonatomic ,copy) NSString *  hp_title;

@end

@protocol EssayModel;


@interface ONEJSONModel : JSONModel

@property (nonatomic ,copy) NSArray<EssayModel> * essay;

@end


