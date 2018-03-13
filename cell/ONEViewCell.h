//
//  ONEViewCell.h
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ONEViewCell : UITableViewCell

@property(nonatomic ,strong) UILabel * themeLabel;
@property(nonatomic ,strong) UILabel * titleLabel;
@property(nonatomic ,strong) UILabel * personLabel;
@property(nonatomic ,strong) UIImageView * pictureImage;
@property(nonatomic ,strong) UILabel * articleLabel;

@property(nonatomic ,strong) UILabel * dayLabel;
@property(nonatomic ,strong) UIButton * praiseBtn;
@property(nonatomic ,strong) UILabel *praiseLable;
@property(nonatomic ,strong) UIButton * shareBtn;

@end
