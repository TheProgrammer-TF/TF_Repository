//
//  TF_FooterView.h
//  ListTable_TF
//
//  Created by sks on 16/8/25.
//  Copyright © 2016年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^newBlock)(NSInteger);

@interface TF_FooterView : UIView
@property (nonatomic, strong) UITableView *footertabelView;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UIView *addView;
//声明属性
@property (nonatomic, copy) newBlock numberBlock;
@end
