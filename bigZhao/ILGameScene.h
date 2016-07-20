//
//  ILGameScene.h
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ILButtonNode.h"
#import "ILGameManager.h"
#import "ILUnitNode.h"
//#import "ILFuc.h"
@class ILMainScene;
@interface ILGameScene : SKScene
@property(strong,nonatomic) ILGameManager *GM;
@property(strong,nonatomic) ILMainScene *parentScene;
//@property(strong,nonatomic) ILButtonNode *stopButton;
@property(strong,nonatomic) SKLabelNode *timeNode;
@property(strong,nonatomic) NSMutableArray *units;
@property(strong,nonatomic) ILButtonNode *okButton;
-(instancetype)initWithSize:(CGSize)size GM:(ILGameManager *)GM;
+(instancetype)sceneWithSize:(CGSize)size GM:(ILGameManager *)GM;

@end
