//
//  ViewController.m
//  SJBorderLineViewProject
//
//  Created by BlueDancer on 2017/6/21.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "ViewController.h"
#import "SJBorderlineView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SJBorderlineView *lineView = [SJBorderlineView borderlineViewWithSide:SJBorderlineSideAll startMargin:10 endMargin:10 lineColor:[UIColor redColor] lineWidth:5];
    lineView.frame = CGRectMake(20, 100, 200, 35);
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
