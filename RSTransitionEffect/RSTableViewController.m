//
//  RSTableViewController.m
//  MJTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import "RSTableViewController.h"

#import "UITableViewCell+Frames.h"

@interface RSTableViewController ()

@property (nonatomic, retain) NSMutableArray* arrayForPlaces;

@end

@implementation RSTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"SampleData" ofType:@"plist"];
    NSMutableDictionary *plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    self.arrayForPlaces = [plistDict objectForKey:@"Data"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary* dict = [self.arrayForPlaces objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"Place"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[dict objectForKey:@"Country"]];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[dict objectForKey:@"Image"]]];
    
    return cell;
}

@end
