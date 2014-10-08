//
//  ViewController.h
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/6/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Pods/XYPieChart/XYPieChart/XYPieChart.h"

@interface ViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource>

@property NSMutableArray *slices;
@property NSArray *sliceColors;

@end

