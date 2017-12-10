//
//  UIWebVIew+SwipeGesture.m
//  BaseProject
//
//  Created by xiaruzhen on 2017/12/10.
//  Copyright © 2017年 cactus. All rights reserved.
//
#import "UIWebVIew+JKSwipeGesture.h"

@interface UIWebView () <UIGestureRecognizerDelegate>

@end

@implementation UIWebView (JKSwipeGesture)

- (void)bp_useSwipeGesture {
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(bp_swipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [swipeRight setNumberOfTouchesRequired:2];
    [swipeRight setDelegate:self];
    [self addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(bp_swipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeLeft setNumberOfTouchesRequired:2];
    [swipeLeft setDelegate:self];
    [self addGestureRecognizer:swipeLeft];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan setMaximumNumberOfTouches:2];
    [pan setMinimumNumberOfTouches:2];
    [self addGestureRecognizer:pan];
    
    [pan requireGestureRecognizerToFail:swipeLeft];
    [pan requireGestureRecognizerToFail:swipeRight];
}

- (void)bp_swipeRight:(UISwipeGestureRecognizer *)recognizer {
    if([recognizer numberOfTouches] == 2 && [self canGoBack]) [self goBack];
}

- (void)bp_swipeLeft:(UISwipeGestureRecognizer *)recognizer {
    if([recognizer numberOfTouches] == 2 && [self canGoForward]) [self goForward];
}

@end