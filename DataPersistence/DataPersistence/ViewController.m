//
//  ViewController.m
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "WriteDataToPlistTool.h"
#import "WriteDataUserDefaultTool.h"
#import "TestCache.h"
//#import "PersonFunction.h"
#import "Student.h"
#import "FMDBSingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //直接写入plist，只能存储基本数据
    NSDictionary *dic = @{
                          @"name": @"Test",
                          @"age": @"22",
                          @"sex": @"boy"
                          };
    [WriteDataToPlistTool writeToFile:@"Test" withData:dic]; //@"Test"这个路径，可以用宏进行定义，方便使用
    NSLog(@"Plist:%@",[WriteDataToPlistTool readDataFromFile:@"Test" withClass:[NSDictionary new]]);
    
    NSArray *arr = @[@"1", @"2", @"3", @"4"];
    [WriteDataToPlistTool writeToFile:nil withData:arr];
    NSLog(@"Plist:%@",[WriteDataToPlistTool readDataFromFile:@"Test" withClass:[NSDictionary new]]);
    NSLog(@"Plist:%@",[WriteDataToPlistTool readDataFromFile:nil withClass:[NSArray new]]);
    
    //保存到用户偏好设置中
    [WriteDataUserDefaultTool writeDataToUserDefaultWithKey:@"KeyName" value:dic];
    NSLog(@"UserDefault:%@",[WriteDataUserDefaultTool readDataFromUserDefaultWithKey:@"KeyName"]);
    
    //归档存储
    [TestCache cacheName:@"Test" sex:@"Boy" dataDic:dic dataArr:arr];
    TestCache *cache = [TestCache readData];
    NSLog(@"Archiver:%@\n%@",cache.name,cache.dataDic);
    
    //CoreData
//    [PersonFunction cacheName:@"Name" age:23 source:89.5];
//    [PersonFunction readFromCoreData];
    
    //FMDB
    Student *student1 = [Student initName:@"test1" age:16 sex:@"boy"];
    [Student cacheStudentInfo:student1];
    [Student readDataFromStudent];
    
    Student *student2 = [Student initName:@"test2" age:19 sex:@"girl"];
    [Student cacheStudentInfo:student2];
    [Student readDataFromStudent];
    
    Student *student3 = [Student initName:@"test3" age:18 sex:@"boy"];
    [Student cacheStudentInfo:student3];
    [Student readDataFromStudent];
    
    [FMDBSingleton closeFMDB];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
