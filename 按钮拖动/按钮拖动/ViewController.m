//
//  ViewController.m
//  按钮拖动
//
//  Created by hao on 16/1/15.
//  Copyright © 2016年 周豪. All rights reserved.
//

#import "ViewController.h"
#import "ZHDragButton.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tip;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZHDragButton *DragBtn = [[ZHDragButton alloc] initWithFrame:CGRectMake(0, 100, 80, 80)];
    DragBtn.backgroundColor = [UIColor redColor];
    DragBtn.dragEnable = YES;
    
#warning 这里不能使用按钮的addTarget方法添加点击事件，我试了下手势可以。可搜索---Button与touchesBegan响应冲突的问题 了解。
    
    UITapGestureRecognizer *oneFingerTwoTaps =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerTwoTaps)] ;
    [DragBtn addGestureRecognizer:oneFingerTwoTaps];
    [self.view addSubview:DragBtn];

    
}

- (void)oneFingerTwoTaps {
     self.tip.text = @"别点我";
     [self.tip setText:@"别点我"];
     NSLog(@"---别点我");
}

@end
