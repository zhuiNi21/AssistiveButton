//  ZHDragButton.m
//  按钮拖动
//
//  Created by hao on 16/1/15.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import "ZHDragButton.h"
#define ZHDragAnimationDuration 0.3f
//隐藏在屏幕里的多少（0~1）
#define ZHDragScale  1

#define SrceenH [UIScreen mainScreen].bounds.size.height
#define SrceenW [UIScreen mainScreen].bounds.size.width

@implementation ZHDragButton

@synthesize dragEnable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!dragEnable) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!dragEnable) {
        return;
    }
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint EndPoint = [touch locationInView:self];
    float offsetX = EndPoint.x - beginPoint.x;
    float offsetY = EndPoint.y - beginPoint.y;
    
    if (self.center.x + offsetX >= SrceenW*ZHDragScale/2) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ZHDragAnimationDuration];
        self.center = CGPointMake(SrceenW-self.bounds.size.width*ZHDragScale/2,self.center.y + offsetY);
        
        [UIView commitAnimations];
    }else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ZHDragAnimationDuration];
          self.center = CGPointMake(self.bounds.size.width*ZHDragScale/2,self.center.y + offsetY);
        
        [UIView commitAnimations];
    }
    if (self.center.y + offsetY >= SrceenH-self.bounds.size.height*ZHDragScale/2) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ZHDragAnimationDuration];
        self.center = CGPointMake(self.center.x,SrceenH-self.bounds.size.height*ZHDragScale/2);
        
        [UIView commitAnimations];
    }else if(self.center.y + offsetY < self.bounds.size.height*ZHDragScale/2)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:ZHDragAnimationDuration];
        self.center = CGPointMake(self.center.x,self.bounds.size.height*ZHDragScale/2);
        
        [UIView commitAnimations];
    }else
    {

    }

    
    
}

@end
