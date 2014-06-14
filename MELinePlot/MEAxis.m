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

-(id) init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id) initWithLength:(int) length shared:(MEShared*) shared {
    self = [super init];
    if (self) {
        // Initialization code
        _lengthInPixels = length;
        _shared = shared;
    }
    return self;
}

+(id) axisWithLength:(int) length shared:(MEShared*) shared {
    return [[self alloc] initWithLength:length shared:shared];
}

-(void) draw {
    CGFloat axisColorRed = 0.0, axisColorGreen = 0.0, axisColorBlue = 0.0, axisColorAlpha = 0.0;
    [_color getRed:&axisColorRed green:&axisColorGreen blue:&axisColorBlue alpha:&axisColorAlpha];
    CGFloat axisColorCGFloat[4] = {axisColorRed, axisColorGreen, axisColorBlue, axisColorAlpha};
    CGContextSetFillColor(_shared.ctx, axisColorCGFloat);
    CGContextSetStrokeColor(_shared.ctx, axisColorCGFloat);
    
    CGContextBeginPath(_shared.ctx);
    
    CGContextMoveToPoint(_shared.ctx, _shared.pointZero.x, _shared.pointZero.y);
    CGContextAddLineToPoint(_shared.ctx, _shared.pointZero.x + _lengthInPixels, _shared.pointZero.y);
    
    CGContextStrokePath(_shared.ctx);
}

@end
