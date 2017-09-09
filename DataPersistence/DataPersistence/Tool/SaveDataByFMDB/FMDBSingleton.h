//
//  FMDBSingleton.h
//  DataPersistence
//
//  Created by Mac on 2017/9/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+FMDB.h"

@interface FMDBSingleton : NSObject<FMDBFilePathDelegate>

@property (nonatomic, strong) FMDatabase *fmdb;
@property (nonatomic, assign) BOOL isOpenDB;

+ (FMDBSingleton *)shareInstance;

+ (BOOL)openFMDB;

+ (void)closeFMDB;

@end
