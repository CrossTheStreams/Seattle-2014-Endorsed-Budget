//
//  RequestJSON.h
//  Seattle 2014 Endorsed Budget
//
//  Created by Andrew Hautau on 10/6/14.
//  Copyright (c) 2014 Andrew Hautau. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestJSON : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate>

@property(strong, nonatomic) NSDictionary* json;

- (void) getRequestForJSON;

@end
