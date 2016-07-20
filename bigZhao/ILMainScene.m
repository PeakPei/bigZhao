//
//  ILMainScene.m
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILMainScene.h"
#import "ILQueue.h"
@implementation ILMainScene
-(instancetype)initWithSize:(CGSize)size GM:(ILGameManager *)GM
{
    if(self=[super initWithSize:size])
    {
        self.backgroundColor=[UIColor whiteColor];
        SKSpriteNode *backgroundNode=[SKSpriteNode spriteNodeWithImageNamed:@"LaunchImage_R4.7.png"];
        backgroundNode.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
        CGFloat kx=self.frame.size.width/backgroundNode.size.width;
        CGFloat ky=self.frame.size.height/backgroundNode.size.height;
        backgroundNode.xScale=kx;
        backgroundNode.yScale=ky;
        backgroundNode.zPosition=-1;
        [self addChild:backgroundNode];
        _GM=GM;
        
        _startButton=[ILButtonNode nodeWithTextureName:@"startButton" action:@selector(startGame) form:self];
        _startButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.45);
        [self addChild:_startButton];
        
        _optionButton=[ILButtonNode nodeWithTextureName:@"optionButton" action:@selector(startOption) form:self];
        _optionButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.3);
        [self addChild:_optionButton];
        
        _optionScene=[ILOptionScene sceneWithSize:self.frame.size GM:_GM];
        _optionScene.parentScene=self;
        
    }
    return self;
}
+(instancetype)sceneWithSize:(CGSize)size GM:(ILGameManager *)GM
{
    return [[self alloc] initWithSize:size GM:GM];
}
-(void)startGame
{
    NSLog(@"game");
    [_startButton stopTouch];
    ILGameScene *gameScene=[ILGameScene sceneWithSize:self.frame.size GM:_GM];
    gameScene.parentScene=self;
    [self.view presentScene:gameScene];
}
-(void)startOption
{
    NSLog(@"option");
    [_optionButton stopTouch];
    [self.view presentScene:_optionScene];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![_startButton mouseDown:touches withEvent:event])
    if(![_optionButton mouseDown:touches withEvent:event])
    {}
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![_startButton mouseUp:touches withEvent:event])
    if(![_optionButton mouseUp:touches withEvent:event])
    {}
    //[_startButton stopTouch];
    //[_optionButton stopTouch];
}
@end
