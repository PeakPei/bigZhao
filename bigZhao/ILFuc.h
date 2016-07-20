//
//  ILFuc.h
//  bigZhao
//
//  Created by 张 家豪 on 15/9/30.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#ifndef bigZhao_ILFuc_h
#define bigZhao_ILFuc_h
int getRndBetween(int bottom,int top)
{
    int rnd=bottom+(arc4random()%(top+1-bottom));
    return rnd;
}

#endif
