//
//  RequestJSON.m
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/6/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import "AppDelegate.h"
#import "RequestJSON.h"

@implementation RequestJSON {
    NSMutableData *receivedData;
    NSURLConnection *theConnection;
}

-(void) getRequestForJSON {
    
    NSURL *url = [NSURL URLWithString: @"https://data.seattle.gov/resource/endorsed-budget-2014-expenditure-allowance-by-budget-control-level-bcl-.json"];
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL: url
                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                            timeoutInterval:60.0];
    
    // Create the NSMutableData for receivedData
    receivedData = [NSMutableData dataWithCapacity: 0];
    
    // create the connection with the request
    theConnection= [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if (!theConnection) {
        // Release the receivedData object.
        receivedData = nil;
        // Inform the user that the connection failed. :(
    }

}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    // Append the new data to receivedData.
    [receivedData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary * requestJSON = [NSJSONSerialization JSONObjectWithData:receivedData
                                                                 options:kNilOptions
                                                                   error:nil];
    [self setJson: requestJSON];
    
}

@end
