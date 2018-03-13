//
//  ONEViewCell.m
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "ONEViewCell.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation ONEViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.themeLabel = [[UILabel alloc] init];
        self.themeLabel.frame = CGRectMake(W*0.37, 10, W*0.3, 20);
        [self.contentView addSubview:self.themeLabel];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0 ;
        self.titleLabel.frame = CGRectMake(20, 40, W-40, 45);
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.personLabel = [[UILabel alloc] init];
        self.personLabel.frame = CGRectMake(20, 95, W*0.3, 25);
        self.personLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.personLabel];
        
        self.pictureImage = [[UIImageView alloc] init];
        self.pictureImage.frame = CGRectMake(20, 130, W-40, H*0.3);
        [self.contentView addSubview:self.pictureImage];
        
        self.articleLabel = [[UILabel alloc] init];        self.articleLabel.font = [UIFont systemFontOfSize:14];
        self.articleLabel.frame = CGRectZero;
//        self.articleLabel.frame = CGRectMake(10, 140+H*0.3, W-20, H*0.1);
        self.articleLabel.numberOfLines = 0;
        [self.contentView addSubview:self.articleLabel];
        
        self.dayLabel = [[UILabel alloc] init];
        self.dayLabel.font = [UIFont systemFontOfSize:14];
//       self.dayLabel.frame = CGRectMake(13, 160+H*0.4, 60, 30);
        [self.contentView addSubview:self.dayLabel];
        
        self.praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.praiseBtn.frame = CGRectMake(W*0.65, 160+H*0.4, 30, 30);
        [self.praiseBtn setImage:[UIImage imageNamed:@"praise.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.praiseBtn];
        
        self.praiseLable = [[UILabel alloc ] init];
        self.praiseLable.font = [UIFont systemFontOfSize:14];
//        self.praiseLable.frame = CGRectMake(W*0.65+30, 150+H*0.4, 80, 20);
        [self.contentView addSubview:self.praiseLable];
        
        self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.shareBtn.frame = CGRectMake(W*0.7+70, 160+H*0.4, 30, 30);
        [self.shareBtn setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:self.shareBtn];
        
    }
    return self;
}

-(void) layoutSubviews
{
//    self.themeLabel.backgroundColor = [UIColor cyanColor];
//    self.titleLabel.backgroundColor = [UIColor cyanColor];
//    self.personLabel.backgroundColor = [UIColor cyanColor];
//    self.pictureImage.backgroundColor = [UIColor cyanColor];
//    self.articleLabel.backgroundColor = [UIColor cyanColor];
//    self.dayLabel.backgroundColor = [UIColor cyanColor];
//    self.praiseBtn.backgroundColor = [UIColor cyanColor];
//    self.praiseLable.backgroundColor = [UIColor cyanColor];
//    self.shareBtn.backgroundColor = [UIColor cyanColor];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
