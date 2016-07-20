//
//  ILGameScene.m
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import "ILGameScene.h"

int getRndBetween(int bottom,int top)
{
    int rnd=bottom+(arc4random()%(top+1-bottom));
    return rnd;
}
@implementation ILGameScene
CGSize nodeSize;
clock_t lastT;
int nowCourse;
BOOL END;
-(instancetype)initWithSize:(CGSize)size GM:(ILGameManager *)GM
{
    if(self=[super initWithSize:size])
    {
        _GM=GM;
        
        /*_stopButton=[ILButtonNode nodeWithTextureName:@"upButton" action:@selector(stopGame) form:self];
        _stopButton.position=CGPointMake(self.frame.size.width*0.85, self.frame.size.height*0.95);
        [self addChild:_stopButton];*/
        
        _timeNode=[SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        _timeNode.text=@"0.00s";
        _timeNode.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.9);
        _timeNode.fontColor=[UIColor redColor];
        _timeNode.zPosition=100;
        _timeNode.fontSize=50;
        [self addChild:_timeNode];
        
        _okButton=[ILButtonNode nodeWithTextureName:@"okButton" action:@selector(backToMain) form:self];
        _okButton.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.3);
        _okButton.zPosition=100;
        
        _units=[NSMutableArray arrayWithCapacity:50];
        
        [self createAllUnit];
        lastT=0;
        nowCourse=0;
        END=NO;
    }
    return self;
}
+(instancetype)sceneWithSize:(CGSize)size GM:(ILGameManager *)GM
{
    return [[self alloc] initWithSize:size GM:GM];
}
-(void)createUnitAt:(CGPoint)point who:(NSString *)name
{
    NSString *nodeName=name;
    if([name isEqualToString:@"bigZhaoEnd"]) name=@"bigZhao";
    ILUnitNode *unit=[ILUnitNode nodeWIthTextureName:name];
    CGFloat k=self.frame.size.width/(_GM.line*unit.texture.size.width);
    unit.xScale=k;
    unit.yScale=k;
    unit.position=point;
    unit.name=nodeName;
    [self addChild:unit];
    [_units addObject:unit];
}
-(void)createAllUnit
{
    nowCourse=10;
    CGFloat x=self.frame.size.width*(1/(2.0*_GM.line));
    ILUnitNode *unit=[ILUnitNode nodeWIthTextureName:@"bigZhao"];
    CGFloat k=self.frame.size.width/(_GM.line*unit.texture.size.width);
    unit.xScale=k;
    unit.yScale=k;
    nodeSize=unit.size;
    CGFloat y=nodeSize.height/2;
    //NSLog(@"%f",self.frame.size.width);
    for(int i=1;i<=10;i++)
    {
        int n=getRndBetween(1,(int)_GM.line);
        for(int j=1;j<=_GM.line;j++)
        {
            NSString *name=@"anduinWrynn";
            if(j==n) {name=@"bigZhao";}
            [self createUnitAt:CGPointMake(-x+2*x*j, -y+2*y*i) who:name];
        }
    }
}
-(void)didMoveToView:(SKView *)view
{
}
-(void)didFinishUpdate
{
    if(lastT!=0&&!END)
    {
        clock_t nowT=clock();
        NSLog(@"%.2lfs",(double)nowT/CLOCKS_PER_SEC);
        _timeNode.text=[NSString stringWithFormat:@"%.2lfs",(double)(nowT-lastT)/CLOCKS_PER_SEC];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![_okButton mouseDown:touches withEvent:event])
    {
        if(END) return;
        for(UITouch *touch in touches)
        {
            CGPoint location=[touch locationInNode:self];
            //CGPoint point=[touch locationInView:self];
            if(location.y>nodeSize.height) return;
            ILUnitNode *node=[self nodeAtPoint:location];
            [node touchDown];
            SKAction *gaction=[SKAction group:@[
                                                [SKAction scaleXTo:0.15 y:0.15 duration:0.05f],
                                                [SKAction rotateByAngle:0.5*M_PI duration:0.05f]]];
            SKAction *action1=[SKAction sequence:@[
                                                  gaction,
                                                  [SKAction removeFromParent]]];
            SKSpriteNode *sprite=[SKSpriteNode spriteNodeWithImageNamed:@"hitArt"];
            sprite.xScale=0.2;
            sprite.yScale=0.2;
            sprite.zPosition=10;
            sprite.position=location;
            [self addChild:sprite];
            [sprite runAction:action1];
            if([node.name isEqualToString:@"anduinWrynn"]) [self loseGame];
            
            if(lastT==0)
            {
                clock_t nowT=clock();
                lastT=nowT;
            }
            SKAction *action=[SKAction moveBy:CGVectorMake(0, -nodeSize.height) duration:0.2f];
            for(ILUnitNode *unit in _units)
            {
                [unit runAction:action];
            }
            NSMutableArray *destroyArray=[NSMutableArray arrayWithCapacity:4];
            for(ILUnitNode *unit in _units)
            {
                if(unit.position.y==nodeSize.height/2)
                {
                    [destroyArray addObject:unit];
                }
            }
            for(ILUnitNode *unit in destroyArray)
            {
                [_units removeObject:unit];
            }
            CGFloat y=19*nodeSize.height/2;
            CGFloat x=self.frame.size.width*(1/(2.0*_GM.line));
            int n=getRndBetween(1, (int)_GM.line);
            if(nowCourse<_GM.course)
            {
                for(int i=1;i<=_GM.line;i++)
                {
                    NSString *name=@"anduinWrynn";
                    if(i==n&&nowCourse+1==_GM.course) name=@"bigZhaoEnd";
                    else if(i==n) name=@"bigZhao";
                    [self createUnitAt:CGPointMake(-x+2*x*i, y) who:name];
                }
                nowCourse++;
            }
            if([node.name isEqualToString:@"bigZhaoEnd"]) [self winGame];
        }
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(![_okButton mouseUp:touches withEvent:event])
    {
        if(END) return;
    }
}
-(void)loseGame
{
    END=YES;
    for(ILUnitNode *unit in _units)
    {
        unit.hidden=YES;
    }
    _timeNode.fontSize=30;
    _timeNode.fontColor=[UIColor whiteColor];
    _timeNode.text=@"就算在牧狗面前";
    _timeNode.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.55);
    SKLabelNode *label=[SKLabelNode labelNodeWithFontNamed:_timeNode.fontName];
    label.text=@"也要优先踩大钊!";
    label.position=CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.45);
    label.fontColor=_timeNode.fontColor;
    label.fontSize=_timeNode.fontSize;
    label.zPosition=_timeNode.zPosition;
    [self addChild:label];
    [self addChild:_okButton];
}
-(void)winGame
{
    END=YES;
    
    NSLog(@"win");
    SKAction *action=[SKAction group:@[
                                       [SKAction moveToY:self.frame.size.height*0.5 duration:0.5f],
                                       [SKAction scaleTo:2 duration:0.5f]]];
    [_timeNode runAction:action];
    [self addChild:_okButton];
}
-(void)backToMain
{
    [self.view presentScene:self.parentScene];
}
@end
