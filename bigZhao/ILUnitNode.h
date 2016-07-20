//
//  ILUnitNode.h
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ILUnitNode : SKSpriteNode
@property(strong,nonatomic) NSString *textureName;
-(instancetype)initWithTextureName:(NSString *)name;
+(instancetype)nodeWIthTextureName:(NSString *)name;
-(void)touchDown;
-(void)stopTouch;
@end
