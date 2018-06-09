//
//  BPTestViewController.m
//  BaseProject
//
//  Created by xiaruzhen on 2017/12/5.
//  Copyright © 2017年 cactus. All rights reserved.
//

#import "BPTestViewController.h"

@interface BPTestViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 系统手势
- (void)configureNaviPropery {
    self.navigationController.hidesBarsWhenKeyboardAppears = YES; // 当键盘弹出的时候，导航栏自动隐藏，默认NO，注意：如果只设置这个属性为YES，键盘出现的时候，导航栏就自动隐藏了，但是之后无论怎么操作，导航栏都不会再显示出来，所有需要配合hidesBarsOnSwipe或者hidesBarsOnTap使用，这样的话，导航栏就能自如的隐藏和展示了
    
    self.navigationController.hidesBarsOnSwipe = YES; // 上下滑动的时候，导航栏自动隐藏和显示
    [self.navigationController.barHideOnSwipeGestureRecognizer addTarget:self action:@selector(swipeGesture:)];
    
    self.navigationController.hidesBarsOnTap = YES; // 点击控制器的时候，导航栏自动隐藏和显示
    
    self.navigationController.hidesBarsWhenVerticallyCompact = YES; // 当导航栏的垂直size比较紧凑的时候，导航栏自动隐藏
    
    //interactivePopGestureRecognizer属性，这个属性是只读的，用来操作控制器的手势返回滑动。
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
    //toolbarHidden属性,toolbarHidden属性默认是关闭的，
    self.navigationController.toolbarHidden = NO;
    
    //hidesBottomBarWhenPushed属性，该属性默认NO，设置为YES的话，在导航栏push控制器的时候，自动将tabBar隐藏，隐藏之后不会自动显示出来，还需手动设置
    self.navigationController.hidesBottomBarWhenPushed = YES;
}

- (void)swipeGesture:(UILongPressGestureRecognizer*)gestureRecognizer{
    BPLog(@"swipeGesture");
}

- (CGSize)intrinsicContentSize {
    return UILayoutFittingExpandedSize;
}


#pragma mark - 边界之外能否响应
- (void)configureViewOut {
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(120);
        make.center.equalTo(self.view);
    }];
    
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor greenColor];
    [backView addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(100);
        make.center.equalTo(backView);
    }];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];//自定义样式
    rightButton.backgroundColor = [UIColor redColor];
    [rightButton setTitle:@"push" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:10.0f];
    [rightButton addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(30);
        make.top.equalTo(view).offset(-15);
        make.trailing.equalTo(view.mas_trailing).offset(15);
    }];
    //    view.layer.masksToBounds = YES;
}

#pragma mark - view hidden lauout 依赖
- (void)configureLayout {
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];//自定义样式
    [rightButton setBackgroundImage:[UIImage imageNamed:@"transitionWithType01"] forState:UIControlStateNormal];
    [rightButton setTitle:@"push" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:27.0f];
    [rightButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [rightButton.titleLabel sizeToFit];
    rightButton.imageView.layer.masksToBounds = YES;
    rightButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [rightButton addTarget:self action:@selector(buttonAct:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rightButton];
    
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.width.height.mas_equalTo(50);
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];//自定义样式
    [bottomButton setBackgroundImage:[UIImage imageNamed:@"transitionWithType01"] forState:UIControlStateNormal];
    [bottomButton setTitle:@"push" forState:UIControlStateNormal];
    [bottomButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    bottomButton.titleLabel.font = [UIFont systemFontOfSize:27.0f];
    [bottomButton.titleLabel setAdjustsFontSizeToFitWidth:YES];
    [bottomButton.titleLabel sizeToFit];
    bottomButton.imageView.layer.masksToBounds = YES;
    bottomButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [bottomButton addTarget:self action:@selector(buttonAct:) forControlEvents:UIControlEventTouchUpInside];
    bottomButton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:bottomButton];
    
    //rightButton.hidden = YES;
    
    [bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(rightButton).offset(100);
        make.width.height.mas_equalTo(50);
        make.centerX.equalTo(self.view);
    }];
}

- (void)next:(UIButton *)bt {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
