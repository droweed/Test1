//
//  Rows.h
//  Test2
//
//  Created by Ryan Ramos on 9/20/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rows : NSObject

- (id)initWithAttributes:(NSDictionary *)attributes;

@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *description;
@property (readonly, nonatomic) NSString *imageHref;

@end
