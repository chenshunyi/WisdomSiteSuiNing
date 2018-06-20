//
//  NSArray+CustomFoundation.m
//  TaoFang
//
//  Created by mxw on 15/12/22.
//  Copyright © 2015年 House365. All rights reserved.
//

#import "NSArray+CustomFoundation.h"

@implementation NSArray (CustomFoundation)

- (id)objectAtSafeIndex:(NSUInteger)index {
    if (index>=0) {
        if (self.count > index)
        {
            return [self objectAtIndex:index];
        }
        return nil;
    }else {
        return nil;
    }
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    //越界的，默认返回数组中的最后一个
    if (index >=0) {
        if (self.count > index)
        {
            return [self objectAtIndex:index];
        }else {
            if (self.count == 0) {
                return nil;
            }else {
                return [self objectAtIndex:self.count-1];
            }
        }
    }else {
        return nil;
    }
    
}

@end
