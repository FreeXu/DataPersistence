//
//  WriteDataUserDefaultTool.m
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "WriteDataUserDefaultTool.h"

/*
 说明：用户偏好设置保存文件；
 特性：轻量级保存；一般用于存储简单的数据（NSData，NSArray，NSDictionary，NSString，NSNumber）；
 缺点：不能保存自定义类型数据；明文存储，安全性弱；
 */

@implementation WriteDataUserDefaultTool

+ (void)writeDataToUserDefaultWithKey:(NSString *)keyName value:(id)values {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:values forKey:keyName];
    [userDefaults synchronize];//立即同步
}

+ (id)readDataFromUserDefaultWithKey:(NSString *)keyName {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:keyName];
}

@end
