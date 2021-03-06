//
// Created by Maya on 1/31/15.
// Copyright (c) 2015 Maya. All rights reserved.
//

#import <Foundation/Foundation.h>
//{"zip":"312 31","country":"Sweden","city":"Laholm","address":"2384 Magdeline Lane","user":"agreen2@163.com","bitcoin":"1BDnspqCqmpZVCabRh6vHccQCA1r5GMAxg"},

@interface UserInfo : NSObject   //создаем класс ЮзерИнфо с набором данных
@property NSString* zip;            //создаем несколько свойств у этого класса
@property NSString* country;
@property NSString* city;
@property NSString* address;
@property NSString* user;
@property NSString* bitcoin;



- (instancetype)initWithZip:(NSString *)zip country:(NSString *)country city:(NSString *)city address:(NSString *)address user:(NSString *)user bitcoin:(NSString *)bitcoin;  //инициализируем класс с его свойствами

- (NSString *)description;      //перекрываем дискрипшен

+ (instancetype)infoWithZip:(NSString *)zip country:(NSString *)country city:(NSString *)city address:(NSString *)address user:(NSString *)user bitcoin:(NSString *)bitcoin;


+ (instancetype)infoWithDictionary:(NSDictionary *)dict;               //инициализируем словарь
@end