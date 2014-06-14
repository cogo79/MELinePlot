//
//  MEAxis.h
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MEShared.h"

@interface MEAxis : NSObject

@property (nonatomic, strong) MEShared *shared;
@property int lengthInPixels;
@property (nonatomic, strong) UIColor *color;

-(id) initWithLength:(int) length shared:(MEShared*) linePlotView;

+(id) axisWithLength:(int) length shared:(MEShared*) linePlotView;

-(void) drawWithRect:(CGRect)rect context:(CGContextRef) ctx;

@end














