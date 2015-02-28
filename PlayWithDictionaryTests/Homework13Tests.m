//
//  Homework13Tests.m
//  PlayWithDictionary
//
//  Created by Maya on 2/28/15.
//  Copyright (c) 2015 Maya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSArray+TestUtils.h"

@interface Homework13Tests : XCTestCase

@end

@implementation Homework13Tests

- (void)testExample1 {

    NSArray *myArray = [[NSArray alloc] init];

    NSDictionary *myDict = [[NSDictionary alloc] init];
}


- (void)testExample2 {

    NSArray *myArray = [NSArray loadTestListByName:@"WomenName" clazz:self.class];

    for (NSUInteger i=0; i<myArray.count; i++) {
        NSString *string = myArray[i];
        NSLog(@"%@", string);
    }

    for (NSString *womennames in myArray){
        NSLog(@"%@", womennames);
    }

    [myArray enumerateObjectsUsingBlock:^(NSString *womennames, NSUInteger idx, BOOL*stop) {
        NSLog(@"%@", womennames);
    }];

}

-(void)testExample3 {

    NSBundle *bundle = [NSBundle bundleForClass:self];

    NSString *path = [bundle pathForResource:path ofType:@"Content-Dictionary"];

    NSDictionary *myDict = [NSDictionary dictionaryWithContentsOfFile:path];

    NSLog(@"%@ ", myDict.count);

    [myDict enumerateKeysAndObjectsUsingBlock:^(NSDictionary *key, id obj, BOOL *stop) {
        NSLog(@"%@ - %@", key, obj);
    }];

    [myDict allKeys];





}










@end
