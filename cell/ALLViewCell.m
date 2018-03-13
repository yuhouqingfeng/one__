//
//  ALLViewCell.m
//  one
//
//  Created by wuxinyi on 17/11/26.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "ALLViewCell.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H  [UIScreen mainScreen].bounds.size.height


@implementation ALLViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.pictureView = [[UIImageView alloc] init];
        self.pictureView.frame = CGRectMake(10, 10, W-20,150);
        [self.contentView addSubview:self.pictureView];
        
        self.textlabel = [[UILabel alloc] init];
        self.textlabel.frame = CGRectZero;
        [self.contentView addSubview:self.textlabel];
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
