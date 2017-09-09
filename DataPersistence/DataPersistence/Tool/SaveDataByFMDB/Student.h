//
//  Student.h
//  DataPersistence
//
//  Created by Mac on 2017/9/8.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *sex;

+ (Student *)initName:(NSString *)name age:(NSInteger)age sex:(NSString *)sex;

+ (void)cacheStudentInfo:(Student *)student;

+ (void)modifyStudentInfo:(Student *)student;

+ (void)deleteStudentInfo:(Student *)student;

+ (void)readDataFromStudent;

+ (void)dropTable;

@end
