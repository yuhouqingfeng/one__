//
//  ReadListJSONModel.h
//  one
//
//  Created by wuxinyi on 17/12/6.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ReadWeatherModel : JSONModel

@property (nonatomic ,copy) NSString * climate;
@property (nonatomic ,copy) NSString * date;
@property (nonatomic ,copy) NSString * wind_direction;
@property (nonatomic ,copy) NSString * hurricane;

@end

@protocol ReadWeatherModel;

//@interface  ReadDataModel : JSONModel
//
//@property (nonatomic ,copy) NSString * id;
//@property (nonatomic ,strong) ReadWeatherModel * weather;
//
//@end
//
//@protocol ReadDataModel;

@interface ReadAuthorModel : JSONModel

@property (nonatomic ,copy) NSString * user_name;
@property (nonatomic ,copy) NSString * desc;
@property (nonatomic ,copy) NSString * fans_total;
@property (nonatomic ,copy) NSString * web_url;

@end


@interface ReadContentModel  : JSONModel

@property (nonatomic ,strong) ReadAuthorModel * author;
@property (nonatomic ,copy) NSString * item_id;
@property (nonatomic ,copy) NSString * title;
@property (nonatomic ,copy) NSString * forward;
@property (nonatomic ,copy) NSString * img_url;
@property (nonatomic ,copy) NSString * share_url;
@property (nonatomic ,copy) NSString * like_count;
@property (nonatomic ,copy) NSString * post_date;
@property (nonatomic ,copy) NSString * pic_info;

@end

@protocol ReadContentModel;

@interface ReadListJSONModel : JSONModel

@property (nonatomic ,strong) ReadWeatherModel * weather;
@property (nonatomic ,copy) NSString * date;
@property (nonatomic ,copy) NSArray<ReadContentModel> * content_list;

@end
