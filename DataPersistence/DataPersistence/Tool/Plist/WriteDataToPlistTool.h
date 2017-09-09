//
//  WriteDataToPlistTool.h
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WriteDataToPlistTool : NSObject

+ (void)writeToFile:(NSString *)file withData:(id)data;
+ (void)writeToFile:(NSString *)file withData:(id)data atomically:(BOOL)useAuxiliaryFile;

+ (id)readDataFromFile:(NSString *)file withClass:(id)classType;

@end
