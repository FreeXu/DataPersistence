//
//  FMDBSingleton.m
//  DataPersistence
//
//  Created by Mac on 2017/9/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "FMDBSingleton.h"

@implementation FMDBSingleton

static FMDBSingleton *_instance = nil;

+ (NSString *)getFilePath {
    return @"data";
}

+ (FMDBSingleton *)shareInstance {
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[FMDBSingleton alloc] init];
            _instance.fmdb = [self createFMDB];
            _instance.isOpenDB = NO;
        });
    }
    return _instance;
}

+ (BOOL)openFMDB {
    if ([self shareInstance].isOpenDB) {
        return YES;
    } else {
        BOOL result = [[self shareInstance].fmdb open];
        if (result) {
            NSLog(@"FMDB数据库打开成功！");
        } else {
            NSLog(@"%@",[[self shareInstance].fmdb lastErrorMessage]);
        }
        [self shareInstance].isOpenDB = result;
        return result;
    }
}

+ (void)closeFMDB {
    if ([self shareInstance].isOpenDB) {
        BOOL result = [[self shareInstance].fmdb close];
        if (result) {
            NSLog(@"FMDB数据库关闭成功！");
        } else {
            NSLog(@"%@",[[self shareInstance].fmdb lastErrorMessage]);
        }
        [self shareInstance].isOpenDB = result;
    }
}

@end
