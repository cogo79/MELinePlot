//
//  MEPlotView.h
//
//  Created by Student vid Yrkeshögskola C3L on 1/20/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MELinePlotView : UIView

@property (nonatomic, strong) NSNumber *xAxisOffset;
@property (nonatomic, strong) NSNumber *yAxisOffset;

@property (nonatomic, strong) NSNumber *xAxisTipOffset;
@property (nonatomic, strong) NSNumber *yAxisTipOffset;

@property (nonatomic, strong) NSNumber *axisTipSize;

@property (nonatomic, strong) NSNumber *overlap_X;
@property (nonatomic, strong) NSNumber *overlap_Y;

@property (nonatomic, strong) UIColor *axisColor;

@property (nonatomic, strong) NSNumber *topValue_X;
@property (nonatomic, strong) NSNumber *topValue_Y;
@property (nonatomic, strong) NSNumber *steps_X;
@property (nonatomic, strong) NSNumber *steps_Y;
@property (nonatomic, strong) NSNumber *labelEveryXStep_X;
@property (nonatomic, strong) NSNumber *labelEveryXStep_Y;
@property (nonatomic, strong) UIColor *labeledStepColor_X;
@property (nonatomic, strong) UIColor *labeledStepColor_Y;

@property (nonatomic, strong) NSNumber *distanceBetweenLastStepAndTip_X;
@property (nonatomic, strong) NSNumber *distanceBetweenLastStepAndTip_Y;
@property (nonatomic, strong) NSNumber *stepLength_X;
@property (nonatomic, strong) NSNumber *stepLength_Y;
@property (nonatomic, strong) UIColor *stepColor_X;
@property (nonatomic, strong) UIColor *stepColor_Y;

//-(void) setAxisRGBColorWithRed:(CGFloat) red Green:(CGFloat) green Blue:(CGFloat) blue Alpha:(CGFloat) alpha;

-(void) drawLineFromPoint:(CGPoint) start toPoint:(CGPoint) end;

@end
