//
//  sectionBtnView.m
//  ListTable_TF
//
//  Created by sks on 16/5/17.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "sectionBtnView.h"

@implementation sectionBtnView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, self.frame.size.height)];
        self.title.text = @"测试";
        [self addSubview:self.title];
        self.clickBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.clickBtn.frame = CGRectMake(self.frame.size.width - 50, 0, 50, self.title.frame.size.height);
        [self.clickBtn setTitle:@"点击" forState:UIControlStateNormal];
        [self addSubview:self.clickBtn];
    }
    return self;
}

@end
