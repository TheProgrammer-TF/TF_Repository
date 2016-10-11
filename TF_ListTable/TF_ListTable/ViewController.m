//
//  ViewController.m
//  ListTable_TF
//
//  Created by sks on 16/5/17.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "ViewController.h"
#import "TFListTableViewController.h"
#import "SectionView.h"
#import "ListTableViewCell.h"
#import "TF-HeadView.h"
#import "TF_FooterView.h"
typedef void (^newBlock)(NSInteger);
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) UITableView *listTable;
@property (nonatomic, strong) UISwitch *swith;
@property (nonatomic, assign) BOOL two;
@property (nonatomic, strong) TF_HeadView *head;
@property (nonatomic, strong) TF_FooterView *footer;
@property (nonatomic, assign) NSInteger num;
//声明属性
@property (nonatomic, copy) newBlock block;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.swith = [[UISwitch alloc] initWithFrame:CGRectMake(0, 600, 50, 30)];
    self.swith.on = YES;
    [self.view addSubview:self.swith];
    NSMutableArray *sectionArr = [NSMutableArray array];
    NSMutableArray *cellArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 2; i++) {
        SectionView *view = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30 * self.view.frame.size.height / 375)];
        if (i == 0) {
            view.title.text = @"是否设置男女人数限制(勾选后显示)";
        } else {
            view.title.text = @"是否需要填写身份证号码";
        }
//        view.title.text = [NSString stringWithFormat:@"%ld",i];
        view.clickBtn.tag = 1000 + i;
        [view.clickBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [sectionArr addObject:view];
    }
    self.cellContentArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 5; i++) {
        NSString *i = [NSString stringWithFormat:@"%u",arc4random()%100];
        [cellArr addObject:i];
        [self.cellContentArr addObject:cellArr];
    }
    self.sectionContentArr = sectionArr;
    self.listTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 22, self.view.frame.size.width, 500) style:UITableViewStylePlain];
    self.listTable.delegate = self;
    self.listTable.dataSource = self;
    self.listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.listTable];
    
    self.head = [[TF_HeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 122)];
    self.listTable.tableHeaderView = self.head;
    self.footer = [[TF_FooterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 80)];
    [self.footer.addBtn addTarget:self action:@selector(addCellAction) forControlEvents:UIControlEventTouchUpInside];
    self.listTable.tableFooterView = self.footer;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeValue:) name:@"value" object:nil];
}
- (void)changeValue:(NSNotification *)notification
{
    NSInteger sum = [[notification.userInfo objectForKey:@"number"] integerValue];
    self.footer.footertabelView.frame = CGRectMake(0, 20, self.footer.frame.size.width, 50 * sum);
    self.footer.frame = CGRectMake(0, 0, self.view.frame.size.width, 80 + 50 * sum);
    self.footer.addView.frame = CGRectMake(0, CGRectGetMaxY(self.footer.footertabelView.frame), self.view.frame.size.width, 50);
    self.listTable.tableFooterView = self.footer;
    [self.footer.footertabelView reloadData];
    [self.listTable reloadData];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"value" object:nil];
}
- (void)clickAction:(UIButton *)btn
{
    if (self.swith.on) {
        NSInteger i = btn.tag - 1000;
        NSLog(@"%ld",i);
        if ([self.dict[[NSNumber numberWithInteger:i]] boolValue]) {
            self.dict[[NSNumber numberWithInteger:i]] = @(NO);
        } else {
            self.dict[[NSNumber numberWithInteger:i]] = @(YES);
        }
        [self.listTable reloadSections:[NSIndexSet indexSetWithIndex:i] withRowAnimation:(UITableViewRowAnimationFade)];
    } else {
        for (int i = 0; i < self.sectionContentArr.count; i++) {
            NSInteger section = btn.tag - 1000;
            if (i == section) {
                if ([self.dict[[NSNumber numberWithInteger:section]] boolValue]) {
                    self.dict[[NSNumber numberWithInteger:section]] = @(NO);
                }else{
                    
                    self.dict[[NSNumber numberWithInteger:section]] = @(YES);
                }
            } else {
                self.dict[[NSNumber numberWithInteger:i]] = @(NO);
            }
        }
        [self.listTable reloadData];
    }
    
}

- (NSMutableDictionary *)dict {
    if (_dict != nil) {
        return _dict;
    }
    _dict = [[NSMutableDictionary alloc] init];
    return _dict;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.sectionContentArr.count != 0) {
        return self.sectionContentArr.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (![self.dict[[NSNumber numberWithInteger:section] ] boolValue]) {
        return 0;
    }
    if (self.isNumber) {
        return self.cellContentArr.count;
    }
    NSArray *arr = self.cellContentArr[section];
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 1;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
//    NSArray *arr = self.cellContentArr[indexPath.section];
    switch (indexPath.section) {
        case 0:
            cell.personImage.backgroundColor = [UIColor redColor];
            if (indexPath.row == 0) {
                cell.personNumber.placeholder = @"请填写您希望的男生的数量";
            } else {
                cell.personNumber.placeholder = @"请填写您希望女生的数量";
            }
            
            break;
        case 1:
            cell.personNumber.placeholder = @"请填写身份证号码";
            break;
//        case 2:
//            cell.content.text = arr[indexPath.row];
//            break;
//        case 3:
//            cell.content.text = arr[indexPath.row];
//            break;
//        case 4:
//            cell.content.text = arr[indexPath.row];
//            break;
        default:
            break;
    }
    
//    cell.contentView.backgroundColor = [UIColor redColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20*self.view.frame.size.height / 375;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 80 + self.num;
//}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionContentArr[section];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    
//    return self.footer;
//}
- (void)addCellAction
{
    self.footer.number = ++self.footer.number;
    self.num = self.footer.number;
    self.footer.footertabelView.frame = CGRectMake(0, 20, self.footer.frame.size.width, 50 * self.num);
    self.footer.frame = CGRectMake(0, 0, self.view.frame.size.width, 80 + 50 * self.num);
    self.footer.addView.frame = CGRectMake(0, CGRectGetMaxY(self.footer.footertabelView.frame), self.view.frame.size.width, 50);
    self.listTable.tableFooterView = self.footer;
    [self.footer.footertabelView reloadData];
    [self.listTable reloadData];
}
@end
