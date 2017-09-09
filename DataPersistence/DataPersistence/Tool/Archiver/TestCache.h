//
//  TestCache.h
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "BaseCache.h"
#import "NSObject+ArchiverFile.h"

@interface TestCache : BaseCache<ArchiverFilePath>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic, strong) NSArray *dataArr;

+ (void)cacheName:(NSString *)name sex:(NSString *)sex dataDic:(NSDictionary *)dic dataArr:(NSArray *)arr;

+ (id)readData;

@end
