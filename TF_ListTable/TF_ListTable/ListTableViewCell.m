//
//  ListTableViewCell.m
//  ListTable_TF
//
//  Created by sks on 16/5/17.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.content = [[UILabel alloc] init];
//        [self.contentView addSubview:self.content];
        self.personImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.personImage];
        self.personNumber = [[UITextField alloc] init];
        [self.contentView addSubview:self.personNumber];
        self.background = [[UIView alloc] init];
        _background.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
        [self.contentView addSubview:_background];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.content.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    
    self.personImage.frame = CGRectMake(10, 0, 40, 40);
    self.personNumber.frame = CGRectMake(60, 0, self.contentView.frame.size.width - 30, self.contentView.frame.size.height - 2);
    self.background.frame = CGRectMake(0 , CGRectGetMaxY(self.personNumber.frame), self.contentView.frame.size.width, 2);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
