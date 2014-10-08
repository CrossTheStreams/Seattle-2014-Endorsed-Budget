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

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.slices = [NSMutableArray arrayWithCapacity:10];
    
    for(int i = 0; i < 5; i ++)
    {
        NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
        [self.slices addObject:one];
    }
    // Do any additional setup after loading the view, typically from a nib.

    
    self.sliceColors = [NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];

    [self.pieChart setDelegate:self];
    [self.pieChart setDataSource:self];
    [self.pieChart setStartPieAngle:M_PI_2];	//optional
    [self.pieChart setAnimationSpeed:1.0];	//optional
    [self.pieChart setLabelFont:[UIFont fontWithName:@"Helvetica" size:24]];	//optional
    [self.pieChart setLabelColor:[UIColor blackColor]];	//optional, defaults to white
//    [self.pieChart setLabelShadowColor:[UIColor blackColor]];	//optional, defaults to none (nil)
    [self.pieChart setLabelRadius:100];	//optional
    [self.pieChart setPieRadius: self.view.frame.size.width/2.2];
    [self.pieChart setShowPercentage:YES];	//optional
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];	//optional
    [self.pieChart setPieCenter:CGPointMake(190, 240)];	//optional
    

    [self.view bringSubviewToFront:self.pieChart];
    [self.pieChart reloadData];
}

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart {
    return 5;
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

-(IBAction)tappedPieChart:(id)sender {
    NSLog(@"you tapped it!");
}

//
//- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index {
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
