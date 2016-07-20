//
//  ILButtonNode.h
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILUnitNode.h"

@interface ILButtonNode : ILUnitNode
@property(strong,nonatomic) id handle;
@property(assign,nonatomic) SEL event;
-(instancetype)initWithTextureName:(NSString *)name action:(SEL)action form:(id)target;
+(instancetype)nodeWithTextureName:(NSString *)name action:(SEL)action form:(id)target;
-(BOOL)mouseDown:(NSSet *)touches withEvent:(UIEvent *)theEvent;
-(BOOL)mouseUp:(NSSet *)touches withEvent:(UIEvent *)theEvent;
@end
