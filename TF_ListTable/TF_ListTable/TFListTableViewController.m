//
//  TFListTableViewController.m
//  ListTable_TF
//
//  Created by sks on 16/5/17.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TFListTableViewController.h"

@interface TFListTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableDictionary *dict;
@end

@implementation TFListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
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
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuse";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 57*self.view.frame.size.width / 375;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.sectionContentArr[section];
}
@end
