//
//  ViewController.h
//  ListTable_TF
//
//  Created by sks on 16/5/17.
//  Copyright © 2016年 TF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//列表内容  当时section下多cell数组里装的是数组
@property (nonatomic, strong) NSMutableArray *cellContentArr;
//列表视图
@property (nonatomic, strong) NSArray *sectionContentArr;
//用它里判断里面section下面是一个cell(yes)还是多个cell(no)
@property (nonatomic, assign) BOOL isNumber;

@end

