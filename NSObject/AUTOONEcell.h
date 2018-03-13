//
//  AUTOONEcell.h
//  one
//
//  Created by wuxinyi on 17/12/9.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUTOONEcell : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign, readonly) CGFloat cellHeight;


//+ (instancetype)messageWithDic:(NSDictionary *)dic;

-(CGSize) getlableheightWith:(NSString *)text;
-(CGSize) getlableWith:(NSString *)text;


@end
