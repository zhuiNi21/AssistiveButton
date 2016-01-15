//
//  ZHDragButton.h
//  按钮拖动
//
//  Created by hao on 16/1/15.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHDragButton : UIButton
{
    CGPoint beginPoint;
}

@property (nonatomic,assign) BOOL dragEnable;

@end
