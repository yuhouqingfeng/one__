//
//  AUTOONEcell.m
//  one
//
//  Created by wuxinyi on 17/12/9.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "AUTOONEcell.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
//#define CUSTOMHEIGHT  140.f + H*0.3

@implementation AUTOONEcell{
    CGFloat _cellHeight;
}
//
//+ (instancetype)messageWithDic:(NSDictionary *)dic {
//    AUTOONEcell *autoonecell = [[self alloc] init];
//    [autoonecell setValuesForKeysWithDictionary:dic];
//    return autoonecell;
//}

-(CGSize) getlableheightWith:(NSString *)text
{
    NSDictionary * dict = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize  lableSize = [text boundingRectWithSize:CGSizeMake(W-20, H-65) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return  lableSize;
}

-(CGSize) getlableWith:(NSString *)text
{
    NSDictionary * dict = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize  lableSize = [text boundingRectWithSize:CGSizeMake(W-80, H-65) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return  lableSize;
}


@end
