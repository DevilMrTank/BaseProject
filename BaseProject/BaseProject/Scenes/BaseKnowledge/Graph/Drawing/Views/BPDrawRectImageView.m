//
//  BPDrawRectImageView.m
//  BaseProject
//
//  Created by Ryan on 2019/9/9.
//  Copyright © 2019 cactus. All rights reserved.
//

#import "BPDrawRectImageView.h"


static CGFloat kWidth = 100;
static CGFloat kHeight = 100;
#define x self.bounds.size.width/2 - 100/2
static CGFloat y = 30;

@implementation BPDrawRectImageView


#pragma mark - 得到当前图形上下文是drawLayer:中传递的
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    return;
    
    //取得图形上下文对象
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 设置上下文状态属性
    //设置笔触颜色：StrokeColor
    
    CGContextSetStrokeColorWithColor(ctx, kThemeColor.CGColor);
    //CGContextSetRGBStrokeColor(ctx, 135.0/255.0, 232.0/255.0, 84.0/255.0, 1);
    
    //设置笔触宽度：LineWidth
    CGContextSetLineWidth(ctx, 1);
    
    //设置填充色：FillColor
    CGContextSetFillColorWithColor(ctx, kExplicitColor.CGColor);
    //CGContextSetRGBFillColor(ctx, 135.0/255.0, 232.0/255.0, 84.0/255.0, 1);
    
    /*设置拐点/连接点样式
     enum CGLineJoin {
     kCGLineJoinMiter, //尖的，斜接
     kCGLineJoinRound, //圆
     kCGLineJoinBevel //斜面
     };
     */
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    /*
     Line cap 线的两端的样式
     enum CGLineCap {
     kCGLineCapButt,
     kCGLineCapRound,
     kCGLineCapSquare
     };
     */
    CGContextSetLineCap(ctx, kCGLineCapSquare);
    
    /*设置线段样式
     phase:虚线开始的位置
     lengths:虚线长度间隔（例如下面的定义说明第一条线段长度8，然后间隔3重新绘制8点的长度线段，当然这个数组可以定义更多元素）
     count:虚线数组元素个数
     */
    CGFloat lengths[2] = {18,9};
    CGContextSetLineDash(ctx, 0, lengths, 2);
    
    /*设置阴影
     context:图形上下文
     offset:偏移量
     blur:模糊度
     color:阴影颜色
     */
    CGColorRef color = kGrayColor.CGColor;//颜色转化，由于Quartz 2D跨平台，所以其中不能使用UIKit中的对象，但是UIkit提供了转化方法
    CGContextSetShadowWithColor(ctx, CGSizeMake(2, 2), 0.8, color);
    
    //画线
    [self drawLineWithCtx:ctx rect:rect];
    
    //使用贝塞尔曲线画圆
    [self drawBezierPathWithCtx:ctx rect:rect];
    
    //画矩形、椭圆形、多边形
    [self drawSharpWithCtx:ctx rect:rect];
    
    //画图片
    [self drawPictureWithCtx:ctx rect:rect];
    
    //画文字
    [self drawTextWithCtx:ctx rect:rect];
}

#pragma mark - 画线
- (void)drawLineWithCtx:(CGContextRef)ctx rect:(CGRect)rect {
    
    //画线方法1：使用CGContextAddLineToPoint添加点的方式
    //设置起始点，左上角
    CGContextMoveToPoint(ctx, x, y);
    //添加一个点，左下角
    CGContextAddLineToPoint(ctx, x,y+kHeight);
    //在添加一个点，变成折线，右下角
    CGContextAddLineToPoint(ctx, x+kWidth, y+kHeight);
    
    //画线方法2:使用点数组
    CGPoint points[] = {CGPointMake(x, y),CGPointMake(x+kWidth, y),CGPointMake(x+kWidth, y+kHeight)};
    CGContextAddLines(ctx,points, 3);
    
    //画线方法3：使用路径（推荐使用路径的方式）
    CGMutablePathRef path = CGPathCreateMutable();
    //设置路径起点
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, x+kWidth/2, y);
    //绘制直线（从起始位置开始）。CGAffineTransformIdentity 类似于初始化一些参数
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, x, y+kHeight/2);
    //绘制另外一条直线（从上一直线终点开始绘制）
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, x+kWidth/2, y+kHeight);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, x+kWidth, y+kHeight/2);
    
    //添加路径到图形上下文
    CGContextAddPath(ctx, path);
    //CGContextClosePath(ctx);
    
    //指定模式下绘制路径/图像到图形上下文
    /*CGPathDrawingMode是填充方式,枚举类型
     kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
     kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
     kCGPathStroke:只有边框
     kCGPathFillStroke：既有边框又有填充
     kCGPathEOFillStroke：奇偶填充并绘制边框
     */
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //直接绘制路径/图像到图形上下文
    CGContextStrokePath(ctx);
    
    // release CF对象
    CGPathRelease(path);
}

#pragma mark - 画矩形、椭圆形、多边形
- (void)drawSharpWithCtx:(CGContextRef)ctx rect:(CGRect)rect{
    
    //画椭圆，如果长宽相等就是圆
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y*2+kHeight, kWidth/2, kHeight));
    
    //画矩形,长宽相等就是正方形
    CGContextAddRect(ctx, CGRectMake(x, y*3+kHeight*2, kWidth/2, kHeight));
    
    //画多边形，多边形是通过path完成的
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, &CGAffineTransformIdentity, self.bounds.size.width/2.0, y*4+kHeight*3);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, self.bounds.size.width/4.0, y*4+kHeight*4);
    CGPathAddLineToPoint(path, &CGAffineTransformIdentity, self.bounds.size.width*3.0/4, y*4+kHeight*4);
    //    CGPathCloseSubpath(path);//关闭路径
    CGContextAddPath(ctx, path);
    
    //填充
    CGContextFillPath(ctx);
}

#pragma mark - 使用贝塞尔曲线画圆

- (void)drawBezierPathWithCtx:(CGContextRef)ctx rect:(CGRect)rect {
    //绘制圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(x+kWidth+20, y*2+kHeight, kWidth/2, kHeight)];
    
    //设置填充颜色
    UIColor *fillColor = kExplicitColor;
    [fillColor set];
    [path fill];
    
    //设置画笔颜色,设置线条颜色
    UIColor *stokeColor = kThemeColor;
    [stokeColor set];
    
    //描线 根据坐标连线
    [path stroke];
}

#pragma mark - 画图片
- (void)drawPictureWithCtx:(CGContextRef)ctx rect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"module_landscape2"];
    [image drawInRect:CGRectMake(x,y*5+kHeight*4, kWidth, kHeight)];//在坐标中画出图片
}

#pragma mark - 画文字
- (void)drawTextWithCtx:(CGContextRef)ctx rect:(CGRect)rect {
    NSDictionary *dict = @{
                           NSFontAttributeName:[UIFont systemFontOfSize:18],
                           NSForegroundColorAttributeName:kWhiteColor
                           };
    [@"hello world" drawInRect:CGRectMake(x, y*6+kHeight*5, self.bounds.size.width, 50) withAttributes:dict];
}

@end