//
//  DTApiBaseBean.h
//  DTApi
//
//  Created by leks on 13-2-18.
//  Copyright (c) 2013年 leks. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DTAPI_DICT_ASSIGN_STRING(property_name, default_value)\
{\
id obj=[dict objectForKey:@#property_name];\
if([obj isKindOfClass:[NSString class]]) self.property_name = obj;\
else if ([obj isKindOfClass:[NSNumber class]]) self.property_name = [NSString stringWithFormat:@"%@", obj];\
else if ([obj isKindOfClass:[NSNull class]]) self.property_name = default_value;\
else self.property_name = default_value;\
}\

#define DTAPI_DICT_ASSIGN_STRING_FromDictionary(dic,property_name, default_value)\
{\
if([dic isKindOfClass:[NSDictionary class]])\
{\
id obj=[dic objectForKey:@#property_name];\
if([obj isKindOfClass:[NSString class]]) self.property_name = obj;\
else if ([obj isKindOfClass:[NSNumber class]]) self.property_name = [NSString stringWithFormat:@"%@", obj];\
else if ([obj isKindOfClass:[NSNull class]]) self.property_name = default_value;\
else self.property_name = default_value;\
}\
else \
{\
self.property_name = default_value;\
}\
}\

#define DTAPI_DICT_ASSIGN_BOOL(property_name, default_value)\
{\
id obj=[dict objectForKey:@#property_name];\
if([obj isKindOfClass:[BOOL class]]) self.property_name = obj;\
else if ([obj isKindOfClass:[NSNull class]]) self.property_name = default_value;\
else self.property_name = default_value;\
}\

#define DTAPI_DICT_ASSIGN_NUMBER(property_name, default_value)\
{\
id obj=[dict objectForKey:@#property_name];\
NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init]; \
if([obj isKindOfClass:[NSNumber class]]) self.property_name = obj;\
else if ([obj isKindOfClass:[NSNull class]]) self.property_name = [formatter numberFromString:default_value];\
else self.property_name = [formatter numberFromString:default_value];\
}\

#define DTAPI_DICT_ASSIGN_ARRAY_BASICTYPE(property_name)\
{\
self.property_name = [NSMutableArray arrayWithCapacity:10];\
id obj=[dict objectForKey:@#property_name];\
if([obj isKindOfClass:[NSArray class]]) \
{\
[self.property_name setArray:obj];\
}\
}\

#define DTAPI_DICT__ARRAY(property_name)\
{\
id obj=[dict objectForKey:@#property_name];\
if([obj isKindOfClass:[NSArray class]]) \
{\
self.property_name = [NSMutableArray arrayWithArray:obj];\
}\
}\

#define DTAPI_DICT_EXPORT_BASICTYPE(property_name)\
if(self.property_name) [md setObject:self.property_name forKey:@#property_name];

#define DTAPI_DICT_EXPORT_ARRAY_BASICTYPE(property_name)\
{\
if ([self.property_name isKindOfClass:[NSArray class]])\
{\
    [md setObject:self.property_name forKey:@#property_name];\
}\
}\

#define DTAPI_DICT_EXPORT_BEAN(property_name)\
if([self.property_name respondsToSelector:@selector(dictionaryValue)])\
[md setObject:[self.property_name dictionaryValue] forKey:@#property_name];

#define DTAPI_DICT_EXPORT_ARRAY_BEAN(property_name)\
{\
if ([self.property_name isKindOfClass:[NSArray class]])\
{\
NSMutableArray *ma = [NSMutableArray arrayWithCapacity:10];\
for (int i=0;i<[self.property_name count];i++)\
{\
    id obj = [self.property_name objectAtIndex:i];\
    if([obj respondsToSelector:@selector(dictionaryValue)]) [ma addObject:[obj dictionaryValue]];\
}\
[md setObject:ma forKey:@#property_name];\
}\
}

#define DTAPI_DECODE(property_name)\
{\
self.property_name = [aDecoder decodeObjectForKey:@#property_name];\
}\

#define DTAPI_ENCODE(property_name)\
{\
[aCoder encodeObject:self.property_name forKey:@#property_name];\
}\

@interface DTApiBaseBean : NSObject

+(id)objectForKey:(NSString*)key inDictionary:(NSDictionary*)dict withClass:(Class)objClass;
+(NSMutableArray*)arrayForKey:(NSString*)key inDictionary:(NSDictionary*)dict withClass:(Class)objClass;
@end
