//
//  ILOptionScene.m
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILOptionScene.h"

@implementation ILOptionScene
-(instancetype)initWithSize:(CGSize)size GM:(ILGameManager *)GM
{
    if(self=[super initWithSize:size])
    {
        self.backgroundColor=[UIColor whiteColor];
        _GM=GM;
        
        _modLabel=[SKLabelNode labelNodeWithText:@"难度"];
        _modLabel.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.8);
        _modLabel.fontColor=[UIColor blackColor];
        [self addChild:_modLabel];
        
        _weakButton=[ILButtonNode nodeWithTextureName:@"weakModButton" action:@selector(weakMod) form:self];
        _weakButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.6);
        [self addChild:_weakButton];
        
        _normalButton=[ILButtonNode nodeWithTextureName:@"normalModButton" action:@selector(normalMod) form:self];
        _normalButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
        [self addChild:_normalButton];
        
        _lordButton=[ILButtonNode nodeWithTextureName:@"lordModButton" action:@selector(lordMod) form:self];
        _lordButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.4);
        [self addChild:_lordButton];
        
        _infoLabel=[SKLabelNode labelNodeWithText:@"Designed by ILORD in Tanzania"];
        _infoLabel.fontColor=[UIColor grayColor];
        _infoLabel.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.1);
        _infoLabel.fontSize=12;
        [self addChild:_infoLabel];
        
        _okButton=[ILButtonNode nodeWithTextureName:@"okButton" action:@selector(backToMain) form:self];
        _okButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.25);
        [self addChild:_okButton];
        
        _pointNode=[SKSpriteNode spriteNodeWithImageNamed:@"pointNode1"];
        _pointNode.zRotation=M_PI;
        _pointNode.xScale=0.5;
        _pointNode.yScale=0.5;
        _pointNode.position=CGPointMake(self.frame.size.width*0.5-_normalButton.size.width*0.5-_pointNode.size.width*0.7, _normalButton.position.y);
        [self addChild:_pointNode];
    }
    return self;
}
+(instancetype)sceneWithSize:(CGSize)size GM:(ILGameManager *)GM
{
    return [[self alloc] initWithSize:size GM:GM];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![_okButton mouseDown:touches withEvent:event])
    if(![_weakButton mouseDown:touches withEvent:event])
    if(![_normalButton mouseDown:touches withEvent:event])
    if(![_lordButton mouseDown:touches withEvent:event])
    {}
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(![_okButton mouseUp:touches withEvent:event])
        if(![_weakButton mouseUp:touches withEvent:event])
            if(![_normalButton mouseUp:touches withEvent:event])
                if(![_lordButton mouseUp:touches withEvent:event])
                {}
}
-(void)weakMod
{
    [_normalButton stopTouch];
    [_lordButton stopTouch];
    _pointNode.position=CGPointMake(_pointNode.position.x, _weakButton.position.y);
    _GM.line=3;
}
-(void)normalMod
{
    [_weakButton stopTouch];
    [_lordButton stopTouch];
    _pointNode.position=CGPointMake(_pointNode.position.x, _normalButton.position.y);
    _GM.line=4;
}
-(void)lordMod
{
    [_weakButton stopTouch];
    [_normalButton stopTouch];
    _pointNode.position=CGPointMake(_pointNode.position.x, _lordButton.position.y);
    _GM.line=5;
}
-(void)backToMain
{
    [_okButton stopTouch];
    [self.view presentScene:self.parentScene];
}
@end
