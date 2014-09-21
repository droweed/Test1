//
//  Facts.m
//  Test2
//
//  Created by Ryan Ramos on 9/20/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "Facts.h"
#import "Rows.h"
#import <AFNetworking/AFJSONRequestOperation.h>

@implementation Facts

@synthesize title = _title;
@synthesize rowData = _rowData;


+ (void)globalGetFactsFromUrl:(void (^)(NSString *title, NSArray *facts, NSError *error))block {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://guarded-basin-2383.herokuapp.com/facts.json"]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
//        NSLog(@"Response - %@", JSON);
        
        NSString *title2 = [JSON valueForKeyPath:@"title"];
        
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"rows"];
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            Rows *rows = [[Rows alloc] initWithAttributes:attributes];
            [mutablePosts addObject:rows];
        }
        
        if(block) {
            block(title2, [NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if(block) {
            block(nil, [NSArray array], error);
        }
    }];
    
    [operation start];
}

@end
