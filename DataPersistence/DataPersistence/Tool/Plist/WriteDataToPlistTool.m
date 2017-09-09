//
//  WriteDataToPlistTool.m
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "WriteDataToPlistTool.h"

/*
 说明：直接写文件保存；
 特性：轻量级保存；一般用于存储简单的数据（NSData，NSArray，NSDictionary，NSString，NSNumber）；
 缺点：不能保存自定义类型数据；
 */

@implementation WriteDataToPlistTool

+ (NSString *)getFileRootDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)getDefaultFilePath {
    NSString *className = NSStringFromClass(self.class);
    return [className lowercaseString];
}

+ (NSString *)getFinalFilePath:(NSString *)filePath {
    if (!filePath) {
        filePath = [self getDefaultFilePath];
    }
    filePath = [[self getFileRootDir] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", filePath]];
    return filePath;
}

+ (void)writeToFile:(NSString *)file withData:(id)data {
    [self writeToFile:[self getFinalFilePath:file] withData:data atomically:YES];
}

+ (void)writeToFile:(NSString *)file withData:(id)data atomically:(BOOL)useAuxiliaryFile {
    if ([data isKindOfClass:[NSData class]]) {
        data = [NSData dataWithData:data];
    }
    else if ([data isKindOfClass:[NSDictionary class]]) {
        data = [NSDictionary dictionaryWithDictionary:data];
    }
    else if ([data isKindOfClass:[NSArray class]]) {
        data = [NSArray arrayWithArray:data];
    }
    else if ([data isKindOfClass:[NSString class]]) {
        data = [NSString stringWithString:data];
    }
    [data writeToFile:file atomically:useAuxiliaryFile];
}

+ (id)readDataFromFile:(NSString *)file withClass:(id)classType {
    file = [self getFinalFilePath:file];
    
    if ([classType isKindOfClass:[NSArray class]]) {
        return [NSArray arrayWithContentsOfFile:file];
    }
    else if ([classType isKindOfClass:[NSDictionary class]]) {
        return [NSDictionary dictionaryWithContentsOfFile:file];
    }
    else if ([classType isKindOfClass:[NSString class]]) {
        return [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    }
    else if ([classType isKindOfClass:[NSData class]]) {
        return [NSData dataWithContentsOfFile:file];
    }
    return nil;
}

@end
