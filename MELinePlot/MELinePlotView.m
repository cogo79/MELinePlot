//
//  MELinePlotView.m
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
        _steps_X = [NSNumber numberWithFloat:10];
    }
    if (_steps_Y == nil) {
        _steps_Y = [NSNumber numberWithFloat:10];
    }
    if (_labelEveryXStep_X == nil) {
        _labelEveryXStep_X = [NSNumber numberWithInt:3];
    }
    if (_labelEveryXStep_Y == nil) {
        _labelEveryXStep_Y = [NSNumber numberWithInt:3];
    }
    if (_labeledStepColor_X == nil) {
        _labeledStepColor_X = [UIColor redColor];
    }
    if (_labeledStepColor_Y == nil) {
        _labeledStepColor_Y = [UIColor redColor];
    }
    if (_labeledStepLength_X == nil) {
        _labeledStepLength_X = [NSNumber numberWithInt:10];
    }
    if (_labeledStepLength_Y == nil) {
        _labeledStepLength_Y = [NSNumber numberWithInt:10];
    }
    if (_distanceBetweenLastStepAndTip_X == nil) {
        _distanceBetweenLastStepAndTip_X = [NSNumber numberWithInt:4];
    }
    if (_distanceBetweenLastStepAndTip_Y == nil) {
        _distanceBetweenLastStepAndTip_Y = [NSNumber numberWithInt:4];
    }
    if (_stepLength_X == nil) {
        _stepLength_X = [NSNumber numberWithInt:6];
    }
    if (_stepLength_Y == nil) {
        _stepLength_Y = [NSNumber numberWithInt:6];
    }
    if (_stepColor_X == nil) {
        _stepColor_X = [UIColor redColor];
    }
    if (_stepColor_Y == nil) {
        _stepColor_Y = [UIColor redColor];
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawXAndYAxis:rect context:ctx];
    [self drawStepsForXAxis:rect context:ctx];
    [self drawStepsForYAxis:rect context:ctx];
    
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

-(void) drawStepsForXAxis:(CGRect)rect context:(CGContextRef) ctx {
    CGContextBeginPath(ctx);
    CGPoint startPoint = CGPointMake(/*rect.origin.x+*/[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    CGPoint endPoint = CGPointMake(rect.size.width-[_xAxisTipOffset intValue] - [_axisTipSize intValue] - [_distanceBetweenLastStepAndTip_X intValue], startPoint.y);
    int pixelsOnXAxis = endPoint.x - startPoint.x + 1;
    CGPoint stepStart = CGPointMake(startPoint.x, startPoint.y - _stepLength_X.intValue/2);
    CGPoint stepEnd = CGPointMake(stepStart.x, stepStart.y+_stepLength_X.intValue);
    CGPoint labeledStepStart = CGPointMake(startPoint.x, startPoint.y - _labeledStepLength_X.intValue / 2);
    CGPoint labeledStepEnd = CGPointMake(stepStart.x, labeledStepStart.y + _labeledStepLength_X.intValue);
    
    CGFloat stepColorRed_X = 0.0, stepColorGreen_X = 0.0, stepColorBlue_X = 0.0, stepColorAlpha_X = 0.0;
    [_stepColor_X getRed:&stepColorRed_X green:&stepColorGreen_X blue:&stepColorBlue_X alpha:&stepColorAlpha_X];
    CGFloat axisStepColorCGFloat[4] = {stepColorRed_X, stepColorGreen_X, stepColorBlue_X, stepColorAlpha_X};
    CGContextSetStrokeColor(ctx, axisStepColorCGFloat);
    
    CGContextBeginPath(ctx);

    int pixelsForward = pixelsOnXAxis/_steps_X.intValue;
    
    for (int i=1; i<=[_steps_X intValue]; i++) {
        stepStart.x += pixelsForward;
        stepEnd.x += pixelsForward;
        
        if  (fmod(i, [_labelEveryXStep_X intValue]) == 0) {
            labeledStepStart.x = stepStart.x;
            labeledStepEnd.x = stepEnd.x;
            CGContextMoveToPoint(ctx, labeledStepStart.x, labeledStepStart.y);
            CGContextAddLineToPoint(ctx, labeledStepEnd.x, labeledStepEnd.y);
        } else {
            CGContextMoveToPoint(ctx, stepStart.x, stepStart.y);
            CGContextAddLineToPoint(ctx, stepEnd.x, stepEnd.y);
        }
    }
    CGContextStrokePath(ctx);
}

-(void) drawStepsForYAxis:(CGRect)rect context:(CGContextRef) ctx {
    CGContextBeginPath(ctx);
    CGPoint startPoint = CGPointMake(rect.origin.x+[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    CGPoint endPoint = CGPointMake(startPoint.x, [_yAxisTipOffset intValue] + [_axisTipSize intValue] + [_distanceBetweenLastStepAndTip_Y intValue]);
    
    int pixelsOnYAxis = startPoint.y + 1 - endPoint.y;
    CGPoint stepStart = CGPointMake(startPoint.x-_stepLength_Y.intValue/2, startPoint.y);
    CGPoint stepEnd = CGPointMake(stepStart.x + _stepLength_Y.intValue, stepStart.y);
    CGPoint labeledStepStart = CGPointMake(startPoint.x - _labeledStepLength_Y.intValue / 2, startPoint.y);
    CGPoint labeledStepEnd = CGPointMake(labeledStepStart.x + _labeledStepLength_Y.intValue, stepStart.y);
    
    CGFloat stepColorRed_Y = 0.0, stepColorGreen_Y = 0.0, stepColorBlue_Y = 0.0, stepColorAlpha_Y = 0.0;
    [_stepColor_Y getRed:&stepColorRed_Y green:&stepColorGreen_Y blue:&stepColorBlue_Y alpha:&stepColorAlpha_Y];
    CGFloat axisStepColorCGFloat[4] = {stepColorRed_Y, stepColorGreen_Y, stepColorBlue_Y, stepColorAlpha_Y};
    CGContextSetStrokeColor(ctx, axisStepColorCGFloat);
    
    CGContextBeginPath(ctx);

    int pixelsForward = pixelsOnYAxis/_steps_Y.intValue;
    
    for (int i=1; i<=[_steps_Y intValue]; i++) {
        stepStart.y -= pixelsForward;
        stepEnd.y -= pixelsForward;
        
        if  (fmod(i, [_labelEveryXStep_Y intValue]) == 0) {
            labeledStepStart.y = stepStart.y;
            labeledStepEnd.y = stepEnd.y;
            CGContextMoveToPoint(ctx, labeledStepStart.x, labeledStepStart.y);
            CGContextAddLineToPoint(ctx, labeledStepEnd.x, labeledStepEnd.y);
        } else {
            CGContextMoveToPoint(ctx, stepStart.x, stepStart.y);
            CGContextAddLineToPoint(ctx, stepEnd.x, stepEnd.y);
        }
    }
    CGContextStrokePath(ctx);
}



/*
 -(void) setAxisRGBColorWithRed:(CGFloat) red Green:(CGFloat) green Blue:(CGFloat) blue Alpha:(CGFloat) alpha {
 
 }
 */

@end















