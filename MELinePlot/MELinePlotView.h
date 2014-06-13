//
//  MELinePlotView.h
//
//  Created by Student vid Yrkeshögskola C3L on 1/20/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "METip.h"
#import "MEPoint.h"
#import "MEAxis.h"

@interface MELinePlotView : UIView

@property (nonatomic, strong) MEPoint *pointZero;
@property (nonatomic, strong) MEAxis *axisEast;
@property (nonatomic, strong) MEAxis *axisWest;
@property (nonatomic, strong) MEAxis *axisNorth;
@property (nonatomic, strong) MEAxis *axisSouth;

@end
