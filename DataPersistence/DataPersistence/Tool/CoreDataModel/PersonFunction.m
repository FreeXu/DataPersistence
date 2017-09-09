//
//  PersonFunction.m
//  DataPersistence
//
//  Created by Mac on 2017/9/7.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "PersonFunction.h"
#import "AppDelegate.h"
//#import "Person+CoreDataClass.h"

@implementation PersonFunction

+ (void)cacheName:(NSString *)name age:(NSInteger)age source:(float)source {
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
//    Person *cache = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:context];
//    cache.name = name;
//    cache.age = age;
//    cache.source = source;
//    [appDelegate saveContext];
}

+ (NSArray *)readFromCoreData {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    NSError *error;
    NSFetchRequest *request = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:context];
    [request setEntity: entity];
    
    NSArray *result = [context executeFetchRequest:request error:&error];
//    for (Person *p in result) {
//        NSLog(@"%@, %d, %.f", p.name, p.age, p.source);
//    }
    
    return result;
}

@end
