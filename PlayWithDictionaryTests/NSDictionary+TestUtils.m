//
// Created by Maya on 2/28/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import "NSDictionary+TestUtils.h"


@implementation NSDictionary (TestUtils)

-(void)logDictionary{

    NSString *dictAsString = [self descriptionInStringsFileFormat:@"\n"];

    NSLog(@"Dict, count:%d \n%@\n", self.count, dictAsString);

}



@end