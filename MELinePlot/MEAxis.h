//
//  MEAxis.h
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELinePlotView.h"

@interface MEAxis : NSObject

@property (nonatomic, weak) MELinePlotView *linePlotView;
@property int lengthInPixels;
@property (nonatomic, strong) UIColor *axisColor;

-(id) initWithLength:(int) length linePlotView:(MELinePlotView*) linePlotView;

+(id) axisWithLength:(int) length linePlotView:(MELinePlotView*) linePlotView;

-(void) drawWithRect:(CGRect)rect context:(CGContextRef) ctx;

@end














