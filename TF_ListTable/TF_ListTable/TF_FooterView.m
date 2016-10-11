//
//  TF_FooterView.m
//  ListTable_TF
//
//  Created by sks on 16/8/25.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TF_FooterView.h"
#import "FooterTableViewCell.h"
@interface TF_FooterView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TF_FooterView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
        [self cteatFooterView];
    }
    return self;
}
- (void)cteatFooterView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(1, 0, self.frame.size.width - 2, 20)];
    label.backgroundColor = self.backgroundColor;
    label.text = @"注:如非必须可不选,影响报名人数";
    [self addSubview:label];
    self.footertabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), self.frame.size.width, 1) style:UITableViewStylePlain];
    self.footertabelView.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
    self.footertabelView.dataSource = self;
    self.footertabelView.delegate = self;
    self.footertabelView.rowHeight = 50;
    [self addSubview:self.footertabelView];
    
    self.addView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.footertabelView.frame), self.frame.size.width, 50)];
    _addView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_addView];
    UIImageView *addImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
    addImage.backgroundColor = [UIColor redColor];
    [_addView addSubview:addImage];
    
    UILabel *addLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(addImage.frame), 0, 300, _addView.frame.size.height)];
    addLabel.text = @"填写自定义填写项";
    [_addView addSubview:addLabel];
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.addBtn.frame = CGRectMake(0, 0, _addView.frame.size.width, 50);
    self.addBtn.backgroundColor = [UIColor clearColor];
    [_addView addSubview:self.addBtn];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.number;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuse = @"reuse";
    FooterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[FooterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    [cell.btn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)deleteAction
{
    self.number = --self.number;
    NSDictionary *dic = @{@"number":@(self.number)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"value" object:nil userInfo:dic];
    [self.footertabelView reloadData];
    
}
@end
