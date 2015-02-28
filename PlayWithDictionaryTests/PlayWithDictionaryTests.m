#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "UserInfo.h"
#import "AddressKey.h"
#import "BadAddressKey.h"
#import "NSArray+TestUtils.h"


static NSString *const TARGET_BITCOIN_ID = @"1C14TpbkGWeLQazm84JhX2yjBA4fbAN4E9";

@interface PlayWithDictionaryTests : XCTestCase

@end

@implementation PlayWithDictionaryTests

- (void)testPerformance_searchInArray {      //создаем тестовый метод для поиска в массиве

    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        NSMutableArray *preparedArray = [self buildPreparedArray];          //создаем массив, в котором будем искать

        [self startMeasuring];    //загрузили массив, начинаем измерения

        __block UserInfo *targetObjects;

        [TestUtils performBlock:^() {

            int targetIndex = [preparedArray indexOfObjectPassingTest:^BOOL(UserInfo *obj, NSUInteger idx, BOOL *stop) {  //описываем искомый элемент, кот. хотим померять

                return [obj.bitcoin isEqualToString:TARGET_BITCOIN_ID];
            }];

            if (targetIndex != NSNotFound) {                      //проверяем то, что нашли

                targetObjects = preparedArray[targetIndex];                  //тест меряет время поиска массива,  вытаскиваем  из массива искомый элемент
            }

        }                nTimes:1000];                           //проделываем измерения  1000раз

        [self stopMeasuring];                 //останавливаем измерения

        NSLog(@"%@", targetObjects);             //выводим в консоль найденный элемент

    }];
}

- (NSMutableArray *)buildPreparedArray {

    NSArray *rawData = [TestUtils loadRawDataArray];           //используем утил по созданию массива

    NSMutableArray *preparedArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];

    for (NSDictionary *dict in rawData) {

        UserInfo *info = [UserInfo infoWithDictionary:dict];

        [preparedArray addObject:info];                       //добавляем элементы в новый массив

    }
    return preparedArray;
}


- (void)testPerformanceSearchInDictionary {                                                 //создаем тестовый метод для поиска по словарю
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        NSDictionary *preparedDictionary = [self buildPreparedDictionary];                  //создаем словарь

        [self startMeasuring];         //начинаем измерения

        __block UserInfo *targetObject;

        [TestUtils performBlock:^() {

            //"country":"China","city":"Yangfang","address":"9 Harbort Crossing"

            BadAddressKey *key = [BadAddressKey keyWithCountry:@"China" city:@"Yangfang" address:@"9 Harbort Crossing"];

            targetObject = [preparedDictionary objectForKey:key];     //ищем по ключу bitcoin 1000 раз

            XCTAssertNotNil(targetObject);

        }                nTimes:1000];


        [self stopMeasuring];                              //останавливаем посик

        NSLog(@"%@", targetObject);                         //выводим в консоль искомый элемент
    }];
}

- (NSDictionary *)buildPreparedDictionary {                            //создаем метод,  который загрузит сырые данные JSON в массив, а потом  создаст словарь на основе ключа bitcoin

    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:rawData.count];

    for (NSDictionary *dict in rawData) {

        UserInfo *info = [UserInfo infoWithDictionary:dict];

        BadAddressKey *key = [BadAddressKey keyWithCountry:info.country city:info.city address:info.address];

        result[key] = info;

    }
    return result;
}

- (void)testFilteringArray {

    NSMutableArray *preparedArray = [self buildPreparedArray];

    //NSArray *countries = [NSArray loadTestListByName:@"Countries_SA" clazz:[self class]];        проверка вхождение в массиве

    NSArray *array = [NSArray loadTestListByName:@"Countries_SA" clazz:[self class]];

    NSSet *countries = [NSSet setWithArray:array];                                           //проверка вхождение в множество
    
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{

        __block NSMutableArray *result;

        [self startMeasuring];

        [TestUtils performBlock:^() {

            result = [[NSMutableArray alloc] init];      //  [NSMutableArray array]  тоже самое, фабричный метод

            for (UserInfo *info in preparedArray) {

                if ([countries containsObject:info.country]) {

                    [result addObject:info];
                }
            }
        } nTimes:100];

        [self stopMeasuring];

        NSLog(@"found users count: %d", result.count);
    }];

}








@end
