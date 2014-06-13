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
    
    if (_pointZero == nil) {
        _pointZero = [MEPoint pointWithX:30 y:rect.size.height-30];
    }
    if (_axisEast == nil) {
        _axisEast = [MEAxis axisWithLength:50 linePlotView:self];
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
}


@end















