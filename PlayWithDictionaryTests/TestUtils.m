//
// Created by Maya on 1/31/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import "TestUtils.h"


@implementation TestUtils {          //реализуем утилиты

}
+ (NSMutableArray *)loadRawDataArray {
    
    NSMutableArray *result = [[NSMutableArray alloc]init];          //создание массива мьютебл

    for (int i=0; i<=23; i++) {                                                //пробегаемся счетчиком по массиву

        NSString *name = [NSString stringWithFormat:@"MOCK_DATA(%d)", i];

        [result addObjectsFromArray:[self loadRawArrayByName:name]];          //результат кладем в новый массив
   }

    return result;
}

+ (NSMutableArray *)loadRawArrayByName:(NSString *)name {            //метод, который загружает сырые данные из файлов типа JSON в массив
    NSMutableArray *result;
    NSBundle *bundle = [NSBundle bundleForClass:self];

    NSString *path = [bundle pathForResource:name ofType:@"json"];

    NSURL *url = [NSURL fileURLWithPath:path];

    NSData *rawData = [NSData dataWithContentsOfURL:url];

    result = [NSJSONSerialization JSONObjectWithData:rawData options:NSJSONReadingMutableContainers error:nil];
    return result;
}


+ (void)performBlock:(void (^)())pFunction nTimes:(int)times {      //реализуем метод с блоком

    for (int i=0; i<times; i++) {
       pFunction();
   }
}
@end