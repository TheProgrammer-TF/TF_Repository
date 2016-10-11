//
//  TF-HeadView.m
//  ListTable_TF
//
//  Created by sks on 16/8/25.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TF-HeadView.h"

@interface TF_HeadView ()

@end

@implementation TF_HeadView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
        [self createHeadView];
    }
    return self;
}
- (void) createHeadView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(1, 0, self.frame.size.width - 2, 20)];
    label.backgroundColor = self.backgroundColor;
    label.text = @"设置用户报名时的必填项*";
    [self addSubview:label];
    
    self.nameView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), self.frame.size.width, 50)];
    self.nameView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.nameView];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, self.nameView.frame.size.height)];
    nameLabel.text = @"姓名";
    [self.nameView addSubview:nameLabel];
    self.nameText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame), 0, 200, self.nameView.frame.size.height)];
    self.nameText.placeholder = @"(必选)";
    [self.nameView addSubview:self.nameText];
    
    UIImageView *nameImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.nameView.frame.size.width - 50, 15, 20, 20)];
    nameImage.backgroundColor = [UIColor redColor];
    [self.nameView addSubview:nameImage];
    
    
    self.telView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameView.frame) + 3, self.frame.size.width, 50)];
    self.telView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.telView];
    UILabel *telLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, self.nameView.frame.size.height)];
    telLabel.text = @"手机";
    [self.telView addSubview:telLabel];
    self.telText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(telLabel.frame), 0, 200, self.nameView.frame.size.height)];
    self.telText.placeholder = @"(必选)";
    [self.telView addSubview:self.telText];
    
    UIImageView *telImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.nameView.frame.size.width - 50, 15, 20, 20)];
    telImage.backgroundColor = [UIColor redColor];
    [self.telView addSubview:telImage];
    
}
@end
