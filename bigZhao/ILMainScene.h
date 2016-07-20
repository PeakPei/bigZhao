//
//  ILMainScene.h
//  bigZhao
//
//  Created by 张 家豪 on 15/9/28.
//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ILGameManager.h"
#import "ILButtonNode.h"
#import "ILOptionScene.h"
#import "ILGameScene.h"
@interface ILMainScene : SKScene
@property(strong,nonatomic) ILGameManager *GM;
@property(strong,nonatomic) ILOptionScene *optionScene;
//@property(strong,nonatomic) ILGameScene *gameScene;
@property(strong,nonatomic) ILButtonNode *startButton;
@property(strong,nonatomic) ILButtonNode *optionButton;
-(instancetype)initWithSize:(CGSize)size GM:(ILGameManager *)GM;
+(instancetype)sceneWithSize:(CGSize)size GM:(ILGameManager *)GM;
@end
