//
//  TF_ViewController.m
//  TF_FMDB
//
//  Created by sks on 16/11/1.
//  Copyright © 2016年 TF. All rights reserved.
//

#import "TF_ViewController.h"
#import "FMDB.h"
@interface TF_ViewController ()
- (IBAction)createBtn:(UIButton *)sender;
- (IBAction)updateBtn:(UIButton *)sender;
- (IBAction)insertBtn:(UIButton *)sender;
- (IBAction)deleteBtn:(UIButton *)sender;
- (IBAction)lookBtn:(UIButton *)sender;
@property ( nonatomic, strong) FMDatabase *db;
@end

@implementation TF_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)createBtn:(UIButton *)sender {
    NSString *string = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [string stringByAppendingString:@"ios.sqlite"];
    NSLog(@"--%@",path);
    self.db = [FMDatabase databaseWithPath:path];
    if ([_db open]) {
        BOOL result = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_ios (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
        if (result) {
            NSLog(@"创表成功");
            }else{
            NSLog(@"创表失败");
            }
    }
}

- (IBAction)updateBtn:(UIButton *)sender {
    //更新数据
    [_db executeUpdate:@"UPDATE t_ios SET age = ? WHERE name = ?;", @20, @"Jack"];
}

- (IBAction)insertBtn:(UIButton *)sender {
    for (int i = 0; i<10; i++) {
        NSString *name = [NSString stringWithFormat:@"jack-%d", arc4random_uniform(100)];
        // executeUpdate : 不确定的参数用?来占位
        [self.db executeUpdate:@"INSERT INTO t_ios (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
    }
}

- (IBAction)deleteBtn:(UIButton *)sender {
    //全部删除
    [self.db executeUpdate:@"DROP TABLE IF EXISTS t_ios;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
}

- (IBAction)lookBtn:(UIButton *)sender {
    // 1.执行查询语句
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_ios"];
    // 2.遍历结果
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"--%d %@ %d", ID, name, age);
       }
    NSLog(@"-----");
}
@end
