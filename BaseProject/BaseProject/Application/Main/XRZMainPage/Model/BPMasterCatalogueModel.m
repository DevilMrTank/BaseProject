//
//  BPMasterCatalogueModel.m
//  BaseProject
//
//  Created by xiaruzhen on 2017/11/9.
//  Copyright © 2017年 cactus. All rights reserved.
//

#import "BPMasterCatalogueModel.h"
#import "NSObject+YYModel.h"

@implementation BPMasterCatalogueModel

- (NSArray *)getArrayData {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in [self handleData]) {
        BPMasterCatalogueModel *model = [BPMasterCatalogueModel modelWithDictionary:dic];
        [array addObject:model];
    }
    return array.copy;
}

- (NSArray *)handleData {
    //_dataArray = @[@"缓存设计",@"数字增长动画",@"KVO封装",];

    NSArray *array = @[
                   @{@"title":@"Bar",
                     @"fileName":@"BPNaviAnimaViewController",
                     @"briefIntro":@"导航栏基本属性及动画/自定义Tabbar",
                     },
                   @{@"title":@"朋友圈",
                     @"fileName":@"",
                     @"briefIntro":@"计算cell高度",
                     },
                   @{@"title":@"popview",
                     @"fileName":@"",
                     @"briefIntro":@"了解锚点动画/箭头PopView(图片/自定义画图)",
                     },
                   @{@"title":@"顶部滑动分类工具",
                     @"fileName":@"",
                     @"briefIntro":@"collectionView相关应用",
                     },
                   @{@"title":@"音频播放器",
                     @"fileName":@"",
                     @"briefIntro":@"边播边下载",
                     },
                   @{@"title":@"图片浏览器",
                     @"fileName":@"",
                     @"briefIntro":@"",
                     },
                   @{@"title":@"图片放大器",
                     @"fileName":@"",
                     @"briefIntro":@"",
                     },
                   @{@"title":@"collectionview高自由度布局",
                     @"fileName":@"",
                     @"briefIntro":@"自由布局/复杂布局",
                     },
                   @{@"title":@"window提示框",
                     @"fileName":@"",
                     @"briefIntro":@"在window上的提示框",
                     },
                   @{@"title":@"自定义转场动画及手势",
                     @"fileName":@"",
                     @"briefIntro":@"自定义转场动画及手势",
                     },
                   @{@"title":@"二级菜单",
                     @"fileName":@"",
                     @"briefIntro":@"菜单联动",
                     },
                   @{@"title":@"高斯模糊",
                     @"fileName":@"",
                     @"briefIntro":@"卡片上(下)拉，背景图高斯模糊效果",
                     },
                   @{@"title":@"抽屉View",
                     @"fileName":@"",
                     @"briefIntro":@"",
                     },
                   @{@"title":@"文字布局",
                     @"fileName":@"",
                     @"briefIntro":@"小说详情页面，coreText",
                     },
                   @{@"title":@"轮播图",
                     @"fileName":@"",
                     @"briefIntro":@"轮播图",
                     },
                   @{@"title":@"动态添加标签",
                     @"fileName":@"",
                     @"briefIntro":@"单行标签/多行标签/位置不固定圆形标签",
                     },
                   @{@"title":@"二维码扫描工具",
                     @"fileName":@"",
                     @"briefIntro":@"二维码扫描用到的动画及maskview",
                     },
                   @{@"title":@"数据库多表关联",
                     @"fileName":@"",
                     @"briefIntro":@"FMDB",
                     },
                   @{@"title":@"图表",
                     @"fileName":@"",
                     @"briefIntro":@"折线图/曲线图/柱状图",
                     },
                   @{@"title":@"GCD应用及信号量",
                     @"fileName":@"",
                     @"briefIntro":@"GCD的应用场景",
                     },
                   @{@"title":@"自定义画图",
                     @"fileName":@"",
                     @"briefIntro":@"drawrect画图",
                     },
                   @{@"title":@"tableView多级目录",
                     @"fileName":@"",
                     @"briefIntro":@"",
                     },
                   @{@"title":@"web桥接",
                     @"fileName":@"",
                     @"briefIntro":@"js与native交互",
                     },
                   @{@"title":@"swift简单语法",
                     @"fileName":@"",
                     @"briefIntro":@"学习下swift",
                     },
                   @{@"title":@"一般动画(验证modelLayer)",
                     @"fileName":@"",
                     @"briefIntro":@"淘宝购物车折叠动画/水波动画/系统卡片动画/数字增长动画",
                     },
                   @{@"title":@"学习第三方库",
                     @"fileName":@"",
                     @"briefIntro":@"AFN/YTK/SDWebImage/MJRefresh/YYKit",
                     },
                   @{@"title":@"算法",
                     @"fileName":@"",
                     @"briefIntro":@"常面试的几种算法",
                     },
                   ];
    return array;
}

@end