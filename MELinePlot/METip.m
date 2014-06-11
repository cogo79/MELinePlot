//
//  METip.m
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import "METip.h"

@implementation METip

-(id) initWithLength:(int) length width:(int) width tailLength:(int) tailLength {
    self = [super init];
    if (self) {
        // Initialization code
        _length = length;
        _width = width;
    }
    return self;
}

+(id) tipWithLength:(int) length width:(int) width tailLength:(int) tailLength {
    return [[self alloc] initWithLength:length width:width tailLength:(int) tailLength];
}

@end
