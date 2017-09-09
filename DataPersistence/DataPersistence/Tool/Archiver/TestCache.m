//
//  TestCache.m
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "TestCache.h"


@implementation TestCache

//+ (NSString *)filePath {
//    return @"cache";
//}

+ (void)cacheName:(NSString *)name sex:(NSString *)sex dataDic:(NSDictionary *)dic dataArr:(NSArray *)arr {
    TestCache *cache = [TestCache new];
    cache.name = name;
    cache.sex = sex;
    cache.dataDic = dic;
    cache.dataArr = arr;
    [cache writeToFile];
}

+ (id)readData {
    return [self readFromFile];
}

@end
