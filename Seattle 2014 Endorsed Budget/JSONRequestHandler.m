//
//  RequestJSON.m
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/6/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import "AppDelegate.h"
#import "JSONRequestHandler.h"

@implementation JSONRequestHandler {
    NSURLConnection *theConnection;
}

- (void) getRequestForJSONWithRequestDelegate: (id) delegate {
    
    NSURL *url = [NSURL URLWithString: @"https://data.seattle.gov/resource/endorsed-budget-2014-expenditure-allowance-by-budget-control-level-bcl-.json"];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL: url
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
    
    // create the connection with the request
    theConnection= [[NSURLConnection alloc] initWithRequest:theRequest delegate: delegate];
    
}



@end
