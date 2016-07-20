//
//  ILOptionScene.h
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ILGameManager.h"
#import "ILButtonNode.h"
@class ILMainScene;
@interface ILOptionScene : SKScene
@property(strong,nonatomic) ILMainScene *parentScene;
@property(strong,nonatomic) ILButtonNode *normalButton;
@property(strong,nonatomic) ILButtonNode *weakButton;
@property(strong,nonatomic) ILButtonNode *lordButton;
@property(strong,nonatomic) ILButtonNode *okButton;
@property(strong,nonatomic) SKLabelNode *modLabel;
@property(strong,nonatomic) SKLabelNode *infoLabel;
@property(strong,nonatomic) SKSpriteNode *pointNode;
@property(strong,nonatomic) ILGameManager *GM;
-(instancetype)initWithSize:(CGSize)size GM:(ILGameManager *)GM;
+(instancetype)sceneWithSize:(CGSize)size GM:(ILGameManager *)GM;
@end
