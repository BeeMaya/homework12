//
// Created by Maya on 1/31/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestUtils : NSObject                   //декларируем класс утилов
+ (NSMutableArray *) loadRawDataArray;            //создаем изменяемый массив, куда будут загружаться сырые данные


+ (NSMutableArray *)loadRawArrayByName:(NSString *)name;

+ (void)performBlock:(void (^)())pFunction nTimes:(int)times;    //создаем метод


@end