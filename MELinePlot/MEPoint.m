//
//  MEPoint.m
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import "MEPoint.h"

@implementation MEPoint

-(id) initWithX:(int) x y:(int) y {
    self = [super init];
    if (self) {
        // Initialization code
        _x = x;
        _y  = y;
    }
    return self;
}

+(id) pointWithX:(int) x y:(int) y {
    return [[self alloc] initWithX:x y:y];
}

@end
