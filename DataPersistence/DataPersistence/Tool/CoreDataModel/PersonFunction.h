//
//  PersonFunction.h
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonFunction : NSObject

+ (void)cacheName:(NSString *)name age:(NSInteger)age source:(float)source;

+ (NSArray *)readFromCoreData;

@end
