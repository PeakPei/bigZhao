//
//  ILQueue.m
//  RpgGameMode
//
//  Created by 张 家豪 on 15/7/31.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILQueue.h"

@implementation ILQueue
-(instancetype)init
{
    if(self=[super init])
    {
        a=[[NSMutableArray alloc] init];
        _count=0;
    }
    return self;
}
-(void)addObject:(id)object
{
    [a addObject:object];
    _count=[a count];
}
-(id)removeObject
{
    id object=nil;
    if([a count]>0)
    {
        object=[a objectAtIndex:0];
        [a removeObjectAtIndex:0];
        _count=[a count];
    }
    return object;
}
-(void)removeAllObject
{
    [a removeAllObjects];
}
@end
