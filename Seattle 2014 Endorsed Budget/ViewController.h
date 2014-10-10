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

@property (strong, nonatomic) IBOutlet XYPieChart *pieChart;
@property (weak, nonatomic) IBOutlet UILabel *chartLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property NSMutableArray *slices;
@property NSArray *sliceColors;
@property NSDictionary *json;
@property BudgetDataMapper *budgetDataMapper;
@property (nonatomic, assign, getter=shouldShowHUD) BOOL showHUD;
@property (nonatomic, assign, getter=isInitVC) BOOL initVC;
@property (nonatomic, strong) NSString *selectedDepartment;
@end

