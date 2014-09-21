//
//  ViewController.m
//  Test2
//
//  Created by Ryan Ramos on 9/20/14.
//  Copyright (c) 2014 NA. All rights reserved.
//

#import "ViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "FactsTableViewCell.h"
#import "Facts.h"
#import "Rows.h"

@interface ViewController ()
- (void) retry:(id)sender;
@end

@implementation ViewController {
    __strong UIActivityIndicatorView *indicatorView;
    
@private NSArray *_facts;
}

@synthesize mTableView;

- (void) loadView {
    [super loadView];
    
    indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicatorView.hidesWhenStopped = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mTableView.dataSource = self;
    self.mTableView.delegate = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:indicatorView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(retry:)];
    
    self.title = @"Facts";
    
    [self retry:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)[_facts count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FactsIdentifier";
    
    FactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell) {
        cell = [[FactsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Rows *row = [_facts objectAtIndex:indexPath.row];
    cell.titleLabel.text = row.title;
    
    if((NSNull *) row.description != [NSNull null])
        cell.descriptionLabel.text = row.description;
    
    if((NSNull *) row.imageHref != [NSNull null])
        [cell.imageView setImageWithURL:[NSURL URLWithString:row.imageHref]
                       placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    
    return cell;
}

- (void)retry:(id)sender
{
    [indicatorView startAnimating];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [Facts globalGetFactsFromUrl:^(NSString *title, NSArray *facts, NSError *error) {
        if(error) {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:[error localizedDescription] delegate:nil cancelButtonTitle:nil otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
        } else {
            //self.title = title;
            
            _facts = facts;
            [self.mTableView reloadData];
        }
        
        [indicatorView stopAnimating];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
}

@end
