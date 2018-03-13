//
//  ONEDataModel.h
//  one
//
//  Created by wuxinyi on 17/12/5.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReadListJSONModel.h"

typedef void(^SucceedBlock) (ReadAuthorModel * readListJSONModel);
typedef void(^ErrorBlock) ();

@interface ONEDataModel : NSObject


@property (nonatomic ,copy) SucceedBlock succeedBlock;
@property (nonatomic ,copy) ErrorBlock errorBlock;

-(void) getarticle;
-(void) getarticle0:(NSString *)str;
-(void) getarticle1:(NSString *)str;
-(void) getarticle2:(NSString *)str;
-(void) getarticle3:(NSString *)str;
-(void) getarticle4:(NSString *)str;

-(void) getPictureList;

//-(void) getArticleWith:(NSString *) string :(SucceedBlock *) succeedBlock:(ErrorBlock)

@end
