# SJBorderLineView
视图 或上或下或左或右 绘制一条线
```
    SJBorderlineView *lineView = [SJBorderlineView borderlineViewWithSide:SJBorderlineSideTop | SJBorderlineSideLeading | SJBorderlineSideBottom | SJBorderlineSideTrailing startMargin:10 endMargin:10 lineColor:[UIColor redColor] lineWidth:5];
    lineView.frame = CGRectMake(20, 100, 200, 35);
    lineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lineView];
```

![GitHub set up](https://github.com/changsanjiang/SJBorderLineView/blob/master/SJBorderLineViewProject/sample.png =200x200)
