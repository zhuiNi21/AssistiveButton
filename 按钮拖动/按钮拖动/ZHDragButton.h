//
//  ZHDragButton.h
//  按钮拖动
//
//  Created by hao on 16/1/15.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import <UIKit/UIKit.h>
//按钮动画的时间间隔
#define ZHDragAnimationDuration 0.3f
//按钮隐藏在屏幕里的部分的多少（0~1）
#define ZHDragScale  1

@interface ZHDragButton : UIButton
@property (nonatomic,assign) BOOL dragEnable;

@end
