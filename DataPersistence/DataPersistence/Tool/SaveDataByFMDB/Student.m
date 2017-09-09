//
//  Student.m
//  DataPersistence
//
//  Created by Mac on 2017/9/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "Student.h"
#import "FMDBSingleton.h"

@implementation Student

+ (BOOL)createTaleInSql {
    FMDatabase *db = [FMDBSingleton shareInstance].fmdb;
    if (db && [FMDBSingleton openFMDB]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL, sex text NOT NULL);"];
        if (result) {
            NSLog(@"表创建成功或已存在");
        } else {
            NSLog(@"%@",[db lastErrorMessage]);
        }
        return result;
    }
    return NO;
}

+ (void)cacheStudentInfo:(Student *)student {
    FMDatabase *db = [FMDBSingleton shareInstance].fmdb;
    if (!db) {
        return;
    }
    
    if ([self createTaleInSql]) {
        BOOL result = [db executeUpdate:@"INSERT INTO student (name, age, sex) VALUES (?,?,?);", student.name,@(student.age),student.sex];
        if (result) {
            NSLog(@"添加成功");
        } else {
            NSLog(@"%@",[db lastErrorMessage]);
        }
    }
}

+ (void)modifyStudentInfo:(Student *)student {
    FMDatabase *db = [FMDBSingleton shareInstance].fmdb;
    if (!db) {
        return;
    }
    
    if ([self createTaleInSql]) {
        BOOL result = [db executeUpdate:@"update student set name = ? where name = ?", student.name,@"Test"];
        if (result) {
            NSLog(@"修改成功");
        } else {
            NSLog(@"%@",[db lastErrorMessage]);
        }
    }
}

+ (void)deleteStudentInfo:(Student *)student {
    FMDatabase *db = [FMDBSingleton shareInstance].fmdb;
    if (!db) {
        return;
    }
    
    if ([self createTaleInSql]) {
        BOOL result = [db executeUpdate:@"delete from student where id = ?;", @1];
        if (result) {
            NSLog(@"删除成功");
        } else {
            NSLog(@"%@",[db lastErrorMessage]);
        }
    }
}

+ (void)readDataFromStudent {
    FMDatabase *db = [FMDBSingleton shareInstance].fmdb;
    if (!db) {
        return;
    }
    
    if ([self createTaleInSql]) {
        //整个表的数据
        FMResultSet *resultSet = [db executeQuery:@"select * from student;"];
        while ([resultSet  next]) {
            //int idNum = [resultSet intForColumn:@"id"];
            NSString *name = [resultSet objectForColumn:@"name"];
            NSInteger age = [resultSet intForColumn:@"age"];
            NSString *sex = [resultSet objectForColumn:@"sex"];
            NSLog(@"name:%@; age:%ld; sex:%@", name, age, sex);
        }
    }
}

+ (void)dropTable {
    FMDatabase *db = [FMDBSingleton shareInstance].fmdb;
    if (!db) {
        return;
    }
    
    if ([self createTaleInSql]) {
        BOOL result = [db executeUpdate:@"DROP TABLE IF EXISTS student;"];
        if (result) {
            NSLog(@"删除表格成功");
        } else {
            NSLog(@"%@",[db lastErrorMessage]);
        }
    }
}

+ (Student *)initName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex {
    Student *student = [Student new];
    student.name = name;
    student.age = age;
    student.sex = sex;
    return student;
}

@end
