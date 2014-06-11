//
//  METip.h
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface METip : NSObject
@property int length, width, tailLength;

-(id) initWithLength:(int) length width:(int) width tailLength:(int) tailLength;

+(id) tipWithLength:(int) length width:(int) width tailLength:(int) tailLength;

@end













