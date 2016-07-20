//
//  ILButtonNode.m
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILButtonNode.h"
@implementation ILButtonNode
-(instancetype)initWithTextureName:(NSString *)name action:(SEL)action form:(id)target
{
    if(self=[super initWithTextureName:name])
    {
        _event=action;
        _handle=target;
    }
    return self;
}
+(instancetype)nodeWithTextureName:(NSString *)name action:(SEL)action form:(id)target
{
    return [[self alloc] initWithTextureName:name action:action form:target];
}
-(BOOL)mouseDown:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInNode:self];
    point=CGPointMake(point.x+self.position.x, point.y+self.position.y);
    if(CGRectContainsPoint(self.frame, point))
    {
        [self touchDown];
        //[_handle performSelector:_event withObject:self];
        return YES;
    }
    return NO;
}
-(BOOL)mouseUp:(NSSet *)touches withEvent:(UIEvent *)theEvent
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInNode:self];
    point=CGPointMake(point.x+self.position.x, point.y+self.position.y);
    if(CGRectContainsPoint(self.frame, point))
    {
        [self stopTouch];
        [_handle performSelector:_event withObject:self];
        return YES;
    }
    return NO;
}
-(void)stopTouch
{
    NSString *str=[NSString stringWithFormat:@"%@1",self.textureName];
    SKTexture *texture=[SKTexture textureWithImageNamed:str];
    self.texture=texture;
}
@end
