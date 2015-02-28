//
// Created by Maya on 1/24/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import "NSArray+TestUtils.h"


@implementation NSArray (TestUtils)

+ (NSArray *)loadTestListByName:(NSString *)name clazz:(Class)clazz
{

    NSBundle *bundle = [NSBundle bundleForClass:clazz];

    NSString *path = [bundle pathForResource:name ofType:@"plist"];  //файлы из PLIST

    NSURL *url = [NSURL fileURLWithPath:path];

    NSArray *borsh=[NSArray arrayWithContentsOfURL:url];

    return borsh;
}


-(void)logArray{

    NSString *arrayAsString = [self componentsJoinedByString:@"\n"];
    NSLog(@"Array, count:%d \n%@\n", self.count, arrayAsString);

}


//+ (NSMutableArray *)arrayByRemovingDuplications:
// NSMutableArray *testArray = [NSMutableArray ];
//
//}

//+(NSMutableArray*) countOfObjectOccurrences: (id) object



@end