//
//  MELinePlotView.h
//
//  Created by Student vid Yrkeshögskola C3L on 1/20/14.
//  Copyright (c) 2014 Powerhouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEPoint.h"
#import "METip.h"
#import "METips.h"

@interface MELinePlotView : UIView


@property (nonatomic, strong) MEPoint *pointZero;
@property (nonatomic, strong) METips *tips;



@end
