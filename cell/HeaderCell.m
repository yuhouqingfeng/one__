//
//  HeaderCell.m
//  one
//
//  Created by wuxinyi on 17/12/10.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "HeaderCell.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation HeaderCell


-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        _headerPicture = [[UIImageView alloc] init];
        _headerPicture.frame = CGRectMake(0, 0, W, H*0.6);
        [self.contentView addSubview:self.headerPicture];
        
        _headerPraiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headerPraiseBtn setImage:[UIImage imageNamed:@"praise1.png"] forState:UIControlStateSelected];
        _headerPraiseBtn.frame = CGRectMake(W*0.7, H*0.55, 40, 20);
        [self.contentView addSubview:self.headerPraiseBtn];
        
        _headerPraiseLabel = [[UILabel alloc] init];
        _headerPraiseLabel.frame = CGRectMake(0.8*W, H*0.55, 60, 20);
        [self.contentView addSubview:self.headerPraiseLabel];
        
        _headerAuthorLabel = [[UILabel alloc] init];
        _headerAuthorLabel.frame = CGRectMake(W*0.4, H*0.6+10, W*0.2, 20);
        [self.contentView addSubview:self.headerAuthorLabel];
        
        _headerTextLabel = [[UILabel alloc] init];
        _headerTextLabel.frame = CGRectZero;
        [self.contentView addSubview:self.headerTextLabel];
        
        _headerNameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.headerNameLabel];
        
        _headerFindImage = [[UIImageView alloc] init];
        [_headerFindImage setImage:[UIImage imageNamed:@"btn3.png"]];
        [self.contentView addSubview:self.headerFindImage];
        
        _headerFindLabel = [[UILabel alloc] init];
        _headerFindLabel.text = @"发现";
        [self.contentView addSubview:self.headerFindLabel];
        
        _headerBtn1  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headerBtn1 setImage:[UIImage imageNamed:@"btn1.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.headerBtn1];
        _headerBtn2  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headerBtn2 setImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.headerBtn2];
        _headerBtn3  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headerBtn3 setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateSelected];
        [self.contentView addSubview:self.headerBtn3];
        
    }
    return self;
}

-(void) layoutSubviews
{
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
