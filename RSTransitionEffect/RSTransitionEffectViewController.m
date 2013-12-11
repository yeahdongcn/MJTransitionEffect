//
//  RSTransitionEffectViewController.m
//  MJTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import "RSTransitionEffectViewController.h"

@interface RSTransitionEffectViewController ()

@end

@implementation RSTransitionEffectViewController

- (void)__prepareTargetFrames
{
    NSMutableDictionary *frames = [NSMutableDictionary dictionary];
    [frames setObject:[NSValue valueWithCGRect:self.view.frame] forKey:@"cell"];
    [frames setObject:[NSValue valueWithCGRect:self.imageView.frame] forKey:@"imageView"];
    [frames setObject:[NSValue valueWithCGRect:self.textLabel.frame] forKey:@"textLabel"];
    [frames setObject:[NSValue valueWithCGRect:self.detailTextLabel.frame] forKey:@"detailTextLabel"];
    self.targetFrames = [NSDictionary dictionaryWithDictionary:frames];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self __prepareTargetFrames];
    
    self.imageView.frame = [[self.sourceFrames objectForKey:@"imageView"] CGRectValue];
    self.textLabel.frame = [[self.sourceFrames objectForKey:@"textLabel"] CGRectValue];
    self.detailTextLabel.frame = [[self.sourceFrames objectForKey:@"detailTextLabel"] CGRectValue];
    
    [UIView animateWithDuration:2.0f animations:^{
        self.imageView.frame = [[self.targetFrames objectForKey:@"imageView"] CGRectValue];
        self.textLabel.frame = [[self.targetFrames objectForKey:@"textLabel"] CGRectValue];
        self.detailTextLabel.frame = [[self.targetFrames objectForKey:@"detailTextLabel"] CGRectValue];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}

@end
