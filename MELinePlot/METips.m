//
//  METips.m
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import "METips.h"

@implementation METips
-(id) initWithNorth:(METip*) north south:(METip*) south west:(METip*) west east:(METip*) east {
    self = [super init];
    if (self) {
        // Initialization code
        _north = north;
        _south = south;
        _west = west;
        _east = east;
    }
    return self;
}

+(id) tipsWithNorth:(METip*) north south:(METip*) south west:(METip*) west east:(METip*) east {
    return [[self alloc] initWithNorth:north south:south west:west east:east];
}

@end
