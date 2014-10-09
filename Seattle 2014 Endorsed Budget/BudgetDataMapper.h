//
//  BudgetDataMapper.h
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/8/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BudgetDataMapper : NSObject

-(void) mapDataByDepartment;

@property (strong, nonatomic) NSArray *jsonData;
// An array of NSDictionaries that represent "slices" in the piechart
@property (strong, nonatomic) NSArray *pieChartData;

@end
