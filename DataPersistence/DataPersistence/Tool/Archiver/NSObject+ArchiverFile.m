//
//  NSObject+ArchiverFile.m
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "NSObject+ArchiverFile.h"

/*
 说明：归档保存文件；
 特性：轻量级保存；遵循NSCoding，进行加密保存；可以保存自定义类型；轻量级保存；
 */

@implementation NSObject (ArchiverFile)

+ (NSString *)getFileRootDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getDefaultFilePath {
    NSString *className = NSStringFromClass(self.class);
    return [className lowercaseString];
}

+ (NSString *)getFinalArchiverFilePath {
    NSString *filePath;
    if ([self conformsToProtocol:@protocol(ArchiverFilePath)] && [self respondsToSelector:@selector(filePath)]) {
        filePath = [self.class filePath];
    }
    else {
        filePath = [self getDefaultFilePath];
    }
    filePath = [[self getFileRootDir] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", filePath]];
    return filePath;
}

- (void)writeToFile {
    [self writeToFile:[self.class getFinalArchiverFilePath]];
}

- (void)writeToFile:(NSString *)file {
    [self writeToFilePath:file atomically:YES];
}

- (void)writeToFilePath:(NSString *)file atomically:(BOOL)useAuxiliaryFile {
    if (![self respondsToSelector:@selector(encodeWithCoder:)]) {
        NSLog(@"未实现encode方法，写入失败");
        return;
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [data writeToFile:file atomically:useAuxiliaryFile];
}

+ (id)readFromFile {
    return [self readFromFile:[self getFinalArchiverFilePath]];
}

+ (id)readFromFile:(NSString *)file {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:file];
}

@end
