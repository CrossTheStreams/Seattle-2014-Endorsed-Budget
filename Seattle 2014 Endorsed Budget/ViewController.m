//
//  ViewController.m
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/6/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@property (strong, nonatomic) IBOutlet XYPieChart *pieChart;


@end

@implementation ViewController {
    NSMutableData *receivedData;
}


- (void) viewDidLoad {
    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.title = @"Seattle 2014 Endorsed Budget";
}


-(void) createPieChart {
    self.slices = [[NSMutableArray alloc] init];
    
    NSArray *pieChartData = [self pieChartData];
    
    
    NSMutableArray *mutableColorArray = [[NSMutableArray alloc] init];
    
    NSArray *colorArray = [NSArray arrayWithObjects:
                           [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                           [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                           [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                           [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                           [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    
//    for(int i = 0; i < 5; i ++)
//    {
//        NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
//        [self.slices addObject:one];
//        [mutableColorArray addObject: colorArray[i % [colorArray count]]];
//        self.sliceColors = [NSArray arrayWithArray: mutableColorArray];
//    }


    for (int i = 0; i < [pieChartData count]; i ++) {
        NSDictionary *pieSlice = pieChartData[i];
        NSNumber *value = [NSNumber numberWithInt:([pieSlice[@"value"] intValue] * 0.01)];
//        NSLog([value stringValue]);
        [self.slices addObject: value];
        [mutableColorArray addObject: colorArray[i % [colorArray count]]];
        self.sliceColors = [NSArray arrayWithArray: mutableColorArray];
    }

    // Do any additional setup after loading the view, typically from a nib.

    [self.pieChart setDelegate:self];
    [self.pieChart setDataSource:self];
    
    [self.pieChart setStartPieAngle:M_PI_2];	//optional
    [self.pieChart setAnimationSpeed:2.0];	//optional
    [self.pieChart setLabelFont:[UIFont fontWithName:@"Helvetica" size:24]];	//optional
    [self.pieChart setLabelColor:[UIColor blackColor]];	//optional, defaults to white
    //    [self.pieChart setLabelShadowColor:[UIColor blackColor]];	//optional, defaults to none (nil)
    CGFloat radius = (self.view.frame.size.width/2 - 20);
    [self.pieChart setLabelRadius:(radius/1.6)];	//optional
    [self.pieChart setPieRadius: radius];
    [self.pieChart setShowPercentage:YES];	//optional
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];	//optional
    [self.pieChart setPieCenter:CGPointMake(self.view.frame.size.width/2, 240)];	//optional
    
    
    [self.view bringSubviewToFront:self.pieChart];
    [self.pieChart reloadData];
}

-(NSArray*) pieChartData {
    return [[self burdgetDataMapper] pieChartData];
}

// XYPiechart delegate methods
- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart {
    return [[self pieChartData] count];
}
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index {
    NSNumber *slice = self.slices[index];
    CGFloat sliceValueFloat = [slice floatValue];
    return sliceValueFloat;
}
- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index {
    return self.sliceColors[index];
}
//- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index;	//optional



#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
//    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}

//
//- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index {
//
//}

-(void) hideHUDWithDelay {
    double delayInSecondsForHideHUD = 1.0;
    dispatch_time_t popTimeForHUD = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSecondsForHideHUD * NSEC_PER_SEC));
    dispatch_after(popTimeForHUD, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    });
}

-(void) loadPieChartWithDelay {
    double delayInSecondsForShowPieChart = 1.30;
    dispatch_time_t popTimeForPieChart = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSecondsForShowPieChart * NSEC_PER_SEC));
    dispatch_after(popTimeForPieChart, dispatch_get_main_queue(), ^(void) {
        [self createPieChart];
    });
}



-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    receivedData = [NSMutableData dataWithCapacity: 0];
    [receivedData appendData:data];
    
    NSArray* requestJSON = [NSJSONSerialization JSONObjectWithData:receivedData
                                                                 options:kNilOptions
                                                                error:nil];
    
    BudgetDataMapper *budgetDataMapper = [[BudgetDataMapper alloc] init];
    [budgetDataMapper setJsonData: requestJSON];
    [budgetDataMapper mapDataByDepartment];
    
    [self setBurdgetDataMapper: budgetDataMapper];
    
    [self hideHUDWithDelay];
    [self loadPieChartWithDelay];

}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
