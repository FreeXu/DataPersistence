//
//  NSObject+FMDB.m
//  DataPersistence
//
//  Created by Mac on 2017/9/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "NSObject+FMDB.h"

@implementation NSObject (FMDB)

+ (NSString *)getFileRootDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getDefaultFilePath {
    NSString *executableFile = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey]; //project name
    return [executableFile lowercaseString];
}

+ (NSString *)getFinalFMDBFilePath {
    NSString *filePath;
    if ([self conformsToProtocol:@protocol(FMDBFilePathDelegate)] && [self respondsToSelector:@selector(getFilePath)]) {
        filePath = [self.class getFilePath];
    } else {
        filePath = [self getDefaultFilePath];
    }
    filePath = [[self getFileRootDir] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", filePath]];
    return filePath;
}

+ (FMDatabase *)createFMDB {
    return [self createFMDBWithPath:[self getFinalFMDBFilePath]];
}

+ (FMDatabase *)createFMDBWithPath:(NSString *)path {
    FMDatabase *db = [FMDatabase databaseWithPath:path];
    return db;
}

@end
