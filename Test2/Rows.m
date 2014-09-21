//
//  Rows.m
//  Test2
//
//  Created by Ryan Ramos on 9/20/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "Rows.h"

@implementation Rows

@synthesize title = _title;
@synthesize description = _description;
@synthesize imageHref = _imageHref;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _title = attributes[@"title"];
    _description = attributes[@"description"];
    _imageHref = attributes[@"imageHref"];
    
    return self;
}

@end
