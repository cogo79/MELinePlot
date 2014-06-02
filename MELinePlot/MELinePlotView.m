//
//  MEPlotView.m
//  CPlot
//
//  Created by Student vid Yrkeshögskola C3L on 1/20/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import "MELinePlotView.h"

@implementation MELinePlotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

-(void) drawLineFromPoint:(CGPoint) start toPoint:(CGPoint) end
{
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if (_xAxisOffset == nil) {
        _xAxisOffset = [NSNumber numberWithInt:30];
    }
    if (_yAxisOffset == nil) {
        _yAxisOffset = [NSNumber numberWithInt:30];
    }
    if (_xAxisTipOffset == nil) {
        _xAxisTipOffset = [NSNumber numberWithInt:30];
    }
    if (_yAxisTipOffset == nil) {
        _yAxisTipOffset = [NSNumber numberWithInt:30];
    }
    if (_axisTipSize == nil) {
        _axisTipSize = [NSNumber numberWithInt:8];
    }
    if (_overlap_X == nil) {
        _overlap_X = [NSNumber numberWithInt:20];
    }
    if (_overlap_Y == nil) {
        _overlap_Y = [NSNumber numberWithInt:20];
    }
    if (_axisColor == nil) {
        _axisColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    if (_topValue_X == nil) {
        _topValue_X = [NSNumber numberWithFloat:10];
    }
    if (_topValue_Y == nil) {
        _topValue_Y = [NSNumber numberWithFloat:10];
    }
    if (_steps_X == nil) {
        _steps_X = [NSNumber numberWithFloat:5];
    }
    if (_steps_Y == nil) {
        _steps_Y = [NSNumber numberWithFloat:5];
    }
    if (_distanceBetweenLastStepAndTip_X == nil) {
        _distanceBetweenLastStepAndTip_X = [NSNumber numberWithInt:4];
    }
    if (_distanceBetweenLastStepAndTip_Y == nil) {
        _distanceBetweenLastStepAndTip_Y = [NSNumber numberWithInt:4];
    }
    if (_stepLength_X == nil) {
        _stepLength_X = [NSNumber numberWithInt:10];
    }
    if (_stepLength_Y == nil) {
        _stepLength_Y = [NSNumber numberWithInt:10];
    }
    if (_stepColor_X == nil) {
        _stepColor_X = [UIColor redColor];
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawXAndYAxis:rect context:ctx];
    [self drawStepsForXAndYAxis:rect context:ctx];
    
    /*
     CGContextBeginPath(ctx);
     int starting
     CGContextMoveToPoint(ctx, rect.origin.x+[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]);
     CGContextStrokePath(ctx);
     */
}

-(void) drawXAndYAxis:(CGRect)rect context:(CGContextRef) ctx {
    CGFloat axisColorRed = 0.0, axisColorGreen = 0.0, axisColorBlue = 0.0, axisColorAlpha = 0.0;
    [_axisColor getRed:&axisColorRed green:&axisColorGreen blue:&axisColorBlue alpha:&axisColorAlpha];
    CGFloat axisColorCGFloat[4] = {axisColorRed, axisColorGreen, axisColorBlue, axisColorAlpha};
    CGContextSetFillColor(ctx, axisColorCGFloat);
    CGContextSetStrokeColor(ctx, axisColorCGFloat);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, rect.origin.x+[_xAxisOffset intValue], rect.origin.y+[_yAxisTipOffset intValue]);
    CGContextAddLineToPoint(ctx, rect.origin.x+[_xAxisOffset intValue]+[_axisTipSize intValue], rect.origin.y+[_yAxisTipOffset intValue]+[_axisTipSize intValue]);
    CGContextAddLineToPoint(ctx, rect.origin.x+[_xAxisOffset intValue]-[_axisTipSize intValue], rect.origin.y+[_yAxisTipOffset intValue]+[_axisTipSize intValue]);
    CGContextAddLineToPoint(ctx, rect.origin.x+[_xAxisOffset intValue], rect.origin.y+[_yAxisTipOffset intValue]);
    CGContextFillPath(ctx);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, rect.origin.x+[_xAxisOffset intValue], rect.origin.y+[_yAxisTipOffset intValue]);
    CGContextAddLineToPoint(ctx, rect.origin.x+[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]+[_overlap_X intValue]);
    CGContextMoveToPoint(ctx, rect.origin.x+[_xAxisOffset intValue]-[_overlap_Y intValue], rect.size.height-[_yAxisOffset intValue]);
    CGContextAddLineToPoint(ctx, rect.size.width-[_xAxisTipOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    CGContextStrokePath(ctx);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, rect.size.width-[_xAxisTipOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    CGContextAddLineToPoint(ctx, rect.size.width-[_xAxisTipOffset intValue]-[_axisTipSize intValue], rect.size.height-[_yAxisOffset intValue]+[_axisTipSize intValue]);
    CGContextAddLineToPoint(ctx, rect.size.width-[_xAxisTipOffset intValue]-[_axisTipSize intValue], rect.size.height-[_yAxisOffset intValue]-[_axisTipSize intValue]);
    CGContextAddLineToPoint(ctx, rect.size.width-[_xAxisTipOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    CGContextFillPath(ctx);
}

-(void) drawStepsForXAndYAxis:(CGRect)rect context:(CGContextRef) ctx {
    // We begin with drawing steps for x axis.
    CGContextBeginPath(ctx);
    CGPoint startPoint = CGPointMake(rect.origin.x+[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    CGPoint endPoint = CGPointMake(rect.size.width-[_xAxisTipOffset intValue] - [_axisTipSize intValue] - [_distanceBetweenLastStepAndTip_X intValue], startPoint.y);
    int pixelsOnXAxis = endPoint.x - startPoint.x + 1;
    CGPoint stepStart = CGPointMake(rect.origin.x+[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]-_stepLength_X.intValue/2);
    CGPoint stepEnd = CGPointMake(stepStart.x, stepStart.y+_stepLength_X.intValue);
    
    CGFloat stepColorRed_X = 0.0, stepColorGreen_X = 0.0, stepColorBlue_X = 0.0, stepColorAlpha_X = 0.0;
    [_stepColor_X getRed:&stepColorRed_X green:&stepColorGreen_X blue:&stepColorBlue_X alpha:&stepColorAlpha_X];
    CGFloat axisStepColorCGFloat[4] = {stepColorRed_X, stepColorGreen_X, stepColorBlue_X, stepColorAlpha_X};
    CGContextSetStrokeColor(ctx, axisStepColorCGFloat);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(ctx, endPoint.x, endPoint.y);
    
    CGContextMoveToPoint(ctx, stepStart.x +10, stepStart.y);
    CGContextAddLineToPoint(ctx, stepEnd.x+10, stepEnd.y);
    
    //    CGContextFillPath(ctx);
    
    CGContextStrokePath(ctx);
}

/*
 -(void) setAxisRGBColorWithRed:(CGFloat) red Green:(CGFloat) green Blue:(CGFloat) blue Alpha:(CGFloat) alpha {
 
 }
 */

@end


/*
Techniques used include Objective-C, Xcode, Cocoa Touch, and Git.
 */













