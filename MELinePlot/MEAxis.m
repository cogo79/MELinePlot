//
//  MEAxis.m
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import "MEAxis.h"
#import "MEPoint.h"

@implementation MEAxis

-(id) initWithLength:(int) length linePlotView:(MELinePlotView*) linePlotView {
    self = [super init];
    if (self) {
        // Initialization code
        _lengthInPixels = length;
        _linePlotView = linePlotView;
    }
    return self;
}

+(id) axisWithLength:(int) length linePlotView:(MELinePlotView*) linePlotView {
    return [[self alloc] initWithLength:length linePlotView:linePlotView];
}

-(void) drawWithRect:(CGRect)rect context:(CGContextRef) ctx {
    CGFloat axisColorRed = 0.0, axisColorGreen = 0.0, axisColorBlue = 0.0, axisColorAlpha = 0.0;
    [_axisColor getRed:&axisColorRed green:&axisColorGreen blue:&axisColorBlue alpha:&axisColorAlpha];
    CGFloat axisColorCGFloat[4] = {axisColorRed, axisColorGreen, axisColorBlue, axisColorAlpha};
    CGContextSetFillColor(ctx, axisColorCGFloat);
    CGContextSetStrokeColor(ctx, axisColorCGFloat);
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, _linePlotView.pointZero.x, _linePlotView.pointZero.y);
    CGContextAddLineToPoint(ctx, _linePlotView.pointZero.x + _lengthInPixels, _linePlotView.pointZero.y);
    CGContextFillPath(ctx);
    
}

@end
