//
//  ILGameManager.m
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILGameManager.h"

@implementation ILGameManager
-(instancetype)init
{
    if(self=[super init])
    {
        _course=50;
        _mod=1;
        _rank=0;
        _line=4;
    }
    return self;
}
@end
