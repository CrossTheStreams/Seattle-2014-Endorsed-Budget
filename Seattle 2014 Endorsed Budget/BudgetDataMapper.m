//
//  BudgetDataMapper.m
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/8/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import "BudgetDataMapper.h"

@implementation BudgetDataMapper



-(void) mapDataByDepartment {
    NSMutableArray *mappedData = [[NSMutableArray alloc] init];
    NSMutableDictionary *byDepartment = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *budgetItem in self.jsonData) {
        NSString *department = budgetItem[@"department"];
        
        NSMutableDictionary *departmentDictionary = byDepartment[department];
        
        if (!departmentDictionary) {
            departmentDictionary = [[NSMutableDictionary alloc] init];
            byDepartment[department] = departmentDictionary;
            departmentDictionary[@"label"] = department;
            [mappedData addObject:departmentDictionary];
        }
        
        NSString *allowanceString = budgetItem[@"_2014_expenditure_allowance"];
        int itemAllowance = [allowanceString intValue];
        
        int currentAllowance = 0;
        
        if ((departmentDictionary[@"value"]) != 0) {
            currentAllowance = [departmentDictionary[@"value"] intValue];
        }

        
        NSNumber *newAllowance = [NSNumber numberWithInt: (currentAllowance + itemAllowance)];
        [departmentDictionary setValue: newAllowance forKey:@"value"];
    }
    [self setPieChartData: [NSArray arrayWithArray: mappedData] ];
    
}

//{
//    "bcl_code" : "I4100",
//    "bcl_purpose" : "The purpose of the Youth Violence Prevention Budget Control Level is to reduce juvenile violent crimes.",
//    "department" : "Department of Neighborhoods",
//    "_2014_expenditure_allowance" : "5631045",
//    "fund" : "General Subfund",
//    "bcl_name" : "Youth Violence Prevention"
//}

-(void) mapDataByNameForDepartment:(NSString*) department {
    NSMutableArray *mappedData = [[NSMutableArray alloc] init];
    NSMutableDictionary *byName = [[NSMutableDictionary alloc] init];
    
    for (NSDictionary *budgetItem in self.jsonData) {
        if ([budgetItem[@"department"] isEqualToString:department]) {
            NSString *name = budgetItem[@"bcl_name"];
        
            NSMutableDictionary *nameDictionary = byName[name];
            
            if (!nameDictionary) {
                nameDictionary = [[NSMutableDictionary alloc] init];
                byName[name] = nameDictionary;
                nameDictionary[@"label"] = name;
                [mappedData addObject:nameDictionary];
            }
            
            NSString *descriptionString = budgetItem[@"bcl_purpose"];
            nameDictionary[@"description"] = descriptionString;
            
            NSString *allowanceString = budgetItem[@"_2014_expenditure_allowance"];
            
            int itemAllowance = [allowanceString intValue];
            
            int currentAllowance = 0;
            
            if ((nameDictionary[@"value"]) != 0) {
                currentAllowance = [nameDictionary[@"value"] intValue];
            }
            
            NSNumber *newAllowance = [NSNumber numberWithInt: (currentAllowance + itemAllowance)];
            [nameDictionary setValue: newAllowance forKey:@"value"];
        }
    }
    
    [self setPieChartData: [NSArray arrayWithArray: mappedData] ];
}

@end
