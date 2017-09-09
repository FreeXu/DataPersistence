//
//  WriteDataUserDefaultTool.h
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WriteDataUserDefaultTool : NSObject

+ (void)writeDataToUserDefaultWithKey:(NSString *)keyName value:(id)values;

+ (id)readDataFromUserDefaultWithKey:(NSString *)keyName;

@end
