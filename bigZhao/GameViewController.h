//
//  GameViewController.h
//  bigZhao
//

//  Copyright (c) 2015年 张 家豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "ILMainScene.h"
#import "ILGameManager.h"

@interface GameViewController : UIViewController
@property(strong,nonatomic) ILMainScene *mainScene;
@property(strong,nonatomic) ILGameManager *GM;
@end
