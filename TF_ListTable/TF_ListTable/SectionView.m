//
//  SectionView.m
//  ListTable_TF
//
//  Created by sks on 16/5/17.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "SectionView.h"

@interface SectionView ()

@end

@implementation SectionView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
        self.title.text = @"测试";
        [self addSubview:self.title];
        self.clickBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.clickBtn.frame = CGRectMake(self.frame.size.width - 50, 0, 50, self.title.frame.size.height);
        [self.clickBtn setTitle:@"点击" forState:UIControlStateNormal];
        self.clickBtn.tag = self.tag;
        [self addSubview:self.clickBtn];
        UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.title.frame), self.frame.size.width, 2)];
        background.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
        [self addSubview:background];
    }
    return self;
}

@end
