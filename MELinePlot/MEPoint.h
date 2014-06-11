//
//  MEPoint.h
//  MELinePlot
//
//  Created by Student vid Yrkeshögskola C3L on 6/11/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEPoint : NSObject
@property int x,y;

-(id) initWithX:(int) x y:(int) y;
+(id) pointWithX:(int) x y:(int) y;

@end
