//
//  METips.h
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "METip.h"

@interface METips : NSObject
@property METip *north,*south,*west,*east;

-(id) initWithNorth:(METip*) north south:(METip*) south west:(METip*) west east:(METip*) east;

+(id) tipsWithNorth:(METip*) north south:(METip*) south west:(METip*) west east:(METip*) east;

@end
