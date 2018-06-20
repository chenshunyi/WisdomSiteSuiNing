//
//  NSArray+CustomFoundation.h
//  TaoFang
//
//  Created by mxw on 15/12/22.
//  Copyright © 2015年 House365. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CustomFoundation)
- (id)objectAtSafeIndex:(NSUInteger)index;
- (id)safeObjectAtIndex:(NSUInteger)index;
@end
