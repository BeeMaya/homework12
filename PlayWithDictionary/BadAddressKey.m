//
// Created by Maya on 2/21/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import "BadAddressKey.h"


@implementation BadAddressKey {

}

- (NSUInteger)hash {

//    NSUInteger hash = [self.country length];         пример1
//    hash += [self.city length];
//    hash += [self.address length];
//    return hash;


//    NSUInteger hash = [self.country characterAtIndex:0] * [self.city characterAtIndex:0] * [self.address characterAtIndex:0];     пример2


    NSUInteger hash = [self.country length];
    hash = hash + [self.city length];
    hash = hash * [self.address characterAtIndex:0];

    return hash;
}




@end