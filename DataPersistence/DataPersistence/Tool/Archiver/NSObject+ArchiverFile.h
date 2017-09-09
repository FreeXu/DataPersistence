//
//  NSObject+ArchiverFile.h
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArchiverFilePath

@optional
+ (NSString *)filePath;

@end

@interface NSObject (ArchiverFile)

- (void)writeToFile;
- (void)writeToFile:(NSString *)file;
- (void)writeToFilePath:(NSString *)file atomically:(BOOL)useAuxiliaryFile;

+ (id)readFromFile;
+ (id)readFromFile:(NSString *)file;

@end
