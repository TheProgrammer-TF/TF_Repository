//
//  FooterTableViewCell.m
//  ListTable_TF
//
//  Created by sks on 16/8/25.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "FooterTableViewCell.h"

@implementation FooterTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.btn setTitle:@"删除" forState:UIControlStateNormal];
        
        [self.contentView addSubview:self.btn];
        self.labr = [[UILabel alloc] init];
        self.labr.text = @"添加";
        [self.contentView addSubview:_labr];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 0, 80, 50);
    self.labr.frame = CGRectMake(10, 0, 80, 50);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
