//
// Created by Maya on 2/21/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AddressKey : NSObject <NSCopying>

@property NSString* country;
@property NSString* city;
@property NSString* address;



- (instancetype)initWithCountry:(NSString *)country city:(NSString *)city address:(NSString *)address;

+ (instancetype)keyWithCountry:(NSString *)country city:(NSString *)city address:(NSString *)address;


@end