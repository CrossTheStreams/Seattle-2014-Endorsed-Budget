//
//  ViewController.h
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/6/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Pods/XYPieChart/XYPieChart/XYPieChart.h"
#import "../Pods/MBProgressHUD/MBProgressHUD.h"
#import "BudgetDataMapper.h"

@interface ViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource, NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property NSMutableArray *slices;
@property NSArray *sliceColors;
@property NSDictionary *json;
@property BudgetDataMapper *burdgetDataMapper;


@end

