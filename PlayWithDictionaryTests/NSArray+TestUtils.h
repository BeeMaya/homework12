//
// Created by Maya on 1/24/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (TestUtils)
+ (NSArray *)loadTestListByName:(NSString *)name clazz:(Class)clazz;

- (void)logArray;

//+(NSMutableArray *)arrayByRemovingDuplications:(NSString *)name clazz:(Class)clazz;

@end