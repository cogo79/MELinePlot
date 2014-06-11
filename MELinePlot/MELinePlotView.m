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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    /*
    if (_xAxisOffset == nil) {
        _xAxisOffset = [NSNumber numberWithInt:30];
    }
    if (_yAxisOffset == nil) {
        _yAxisOffset = [NSNumber numberWithInt:30];
    }
     */
    if (_pointZero == nil) {
        _pointZero = [MEPoint pointWithX:30 y:rect.size.height-30];
    }//    CGPoint startPoint = CGPointMake(/*rect.origin.x+*/[_xAxisOffset intValue], rect.size.height-[_yAxisOffset intValue]);
    if (_tips == nil) {
        _tips = [METips tipsWithNorth:[METip tipWithLength:8 width:4 tailLength:4] south:nil west:nil east:[METip tipWithLength:8 width:4 tailLength:4]];
        
    }
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
}


@end















