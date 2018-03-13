//
//  HandleViewCell.m
//  one
//
//  Created by wuxinyi on 17/12/12.
//  Copyright © 2017年 wuxinyi. All rights reserved.
//

#import "HandleViewCell.h"
#define W  [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@implementation HandleViewCell

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.textlabel = [[UILabel alloc] init];
        self.textlabel.frame = CGRectMake(W*0.35, 5, W*0.3, 20);
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
