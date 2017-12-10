//
//  UIImageView+BetterFace.h
//  BaseProject
//
//  Created by xiaruzhen on 2017/12/10.
//  Copyright © 2017年 cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (JKBetterFace)

@property (nonatomic) BOOL bp_needsBetterFace;
@property (nonatomic) BOOL bp_fast;

void bp_hack_uiimageview_bf(void);
- (void)bp_setBetterFaceImage:(UIImage *)image;

@end