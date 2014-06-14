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
    if (_shared == nil) {
        _shared = [[MEShared alloc] init];
    }
    if (_shared.pointZero == nil) {
        _shared.pointZero = [MEPoint pointWithX:30 y:rect.size.height-30];
    }
    if (_axisEast == nil) {
        _axisEast = [MEAxis axisWithLength:50 shared:self.shared];
    }
    if (_axisEast.color == nil) {
        _axisEast.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [_axisEast drawWithRect:rect context:ctx];
    
}


@end















