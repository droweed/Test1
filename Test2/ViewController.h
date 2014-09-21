//
//  ViewController.h
//  Test2
//
//  Created by Ryan Ramos on 9/20/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@end
