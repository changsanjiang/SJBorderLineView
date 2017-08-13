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

@property (nonatomic, strong) SJBorderlineView *borderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SJBorderlineView *lineView = [SJBorderlineView borderlineViewWithSide:SJBorderlineSideAll startMargin:10 endMargin:10 lineColor:[UIColor redColor] lineWidth:5 backgroundColor:[UIColor greenColor]];
    lineView.frame = CGRectMake(20, 100, 200, 35);
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
    
    
    self.borderView = lineView;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.borderView.side = SJBorderlineSideTop;
        [self.borderView update];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
