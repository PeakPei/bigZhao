//
//  ILUnitNode.m
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILUnitNode.h"

@implementation ILUnitNode
-(instancetype)initWithTextureName:(NSString *)name
{
    NSString *str=[NSString stringWithFormat:@"%@1",name];
    SKTexture *texture=[SKTexture textureWithImageNamed:str];
    if(self=[super initWithTexture:texture])
    {
        _textureName=name;
    }
    return self;
}
+(instancetype)nodeWIthTextureName:(NSString *)name
{
    return [[self alloc] initWithTextureName:name];
}
-(void)touchDown
{
    NSString *str=[NSString stringWithFormat:@"%@2",_textureName];
    SKTexture *texture=[SKTexture textureWithImageNamed:str];
    self.texture=texture;
}
-(void)stopTouch
{
    NSString *str=[NSString stringWithFormat:@"%@3",_textureName];
    SKTexture *texture=[SKTexture textureWithImageNamed:str];
    self.texture=texture;
}
@end
