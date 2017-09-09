//
//  NSObject+FMDB.h
//  DataPersistence
//
//  Created by Mac on 2017/9/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDb.h"

@protocol FMDBFilePathDelegate

@optional
+ (NSString *)getFilePath;

@end

@interface NSObject (FMDB)

+ (FMDatabase *)createFMDB;

+ (FMDatabase *)createFMDBWithPath:(NSString *)path;

@end
