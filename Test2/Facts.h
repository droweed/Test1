//
//  Facts.h
//  Test2
//
//  Created by Ryan Ramos on 9/20/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Facts : NSObject

@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSDictionary *rowData;

+ (void)globalGetFactsFromUrl:(void (^)(NSString *title, NSArray *facts, NSError *error))block;

@end
