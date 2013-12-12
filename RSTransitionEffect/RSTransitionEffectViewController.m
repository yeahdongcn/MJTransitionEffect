//
//  RSTransitionEffectViewController.m
//  MJTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import "RSTransitionEffectViewController.h"

#import "RSBasicItem.h"

@interface RSTransitionEffectViewController ()

@property (nonatomic, strong) UIImage *image;

@end

@implementation RSTransitionEffectViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, 0.0f);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [window.layer renderInContext:context];
        self.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return self;
}

- (void)__bindItem
{
    self.textLabel.text = self.item.text;
    self.detailTextLabel.text = self.item.detailText;
    self.imageView.image = self.item.image;
    [self.textLabel sizeToFit];
    [self.detailTextLabel sizeToFit];
}

- (void)__prepareTargetFrames
{
    NSMutableDictionary *frames = [NSMutableDictionary dictionary];
    
    [frames setObject:[NSValue valueWithCGRect:self.cell.frame] forKey:@"cell"];
    
    [frames setObject:[NSValue valueWithCGRect:self.imageView.frame] forKey:@"imageView"];
    
    CGRect frame = self.textLabel.frame;
    frame.origin.x = roundf((self.view.bounds.size.width - frame.size.width) / 2.0f);
    [frames setObject:[NSValue valueWithCGRect:frame] forKey:@"textLabel"];
    
    frame = self.detailTextLabel.frame;
    frame.origin.x = roundf((self.view.bounds.size.width - frame.size.width) / 2.0f);
    [frames setObject:[NSValue valueWithCGRect:frame] forKey:@"detailTextLabel"];
    
    self.targetFrames = [NSDictionary dictionaryWithDictionary:frames];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.backgroundView.backgroundColor = [UIColor colorWithPatternImage:self.image];
    
    [self __bindItem];
    
    [self __prepareTargetFrames];

    self.cell.frame = [[self.sourceFrames objectForKey:@"cell"] CGRectValue];
    self.imageView.frame = [[self.sourceFrames objectForKey:@"imageView"] CGRectValue];
    self.textLabel.frame = [[self.sourceFrames objectForKey:@"textLabel"] CGRectValue];
    self.detailTextLabel.frame = [[self.sourceFrames objectForKey:@"detailTextLabel"] CGRectValue];
    
    CGRect frame = self.toolbar.frame;
    frame.origin.y += frame.size.height;
    self.toolbar.frame = frame;
    
    [UIView animateWithDuration:1.0f animations:^{
        self.backgroundView.alpha = 0;
        
        self.cell.frame = [[self.targetFrames objectForKey:@"cell"] CGRectValue];
        self.imageView.frame = [[self.targetFrames objectForKey:@"imageView"] CGRectValue];
        self.textLabel.frame = [[self.targetFrames objectForKey:@"textLabel"] CGRectValue];
        self.detailTextLabel.frame = [[self.targetFrames objectForKey:@"detailTextLabel"] CGRectValue];
        
        CGRect frame = self.toolbar.frame;
        frame.origin.y -= frame.size.height;
        self.toolbar.frame = frame;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender
{
    [UIView animateWithDuration:1.0f animations:^{
        self.backgroundView.alpha = 1;
        
        self.cell.frame = [[self.sourceFrames objectForKey:@"cell"] CGRectValue];
        self.imageView.frame = [[self.sourceFrames objectForKey:@"imageView"] CGRectValue];
        self.textLabel.frame = [[self.sourceFrames objectForKey:@"textLabel"] CGRectValue];
        self.detailTextLabel.frame = [[self.sourceFrames objectForKey:@"detailTextLabel"] CGRectValue];
        
        CGRect frame = self.toolbar.frame;
        frame.origin.y += frame.size.height;
        self.toolbar.frame = frame;
    } completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:NO];
    }];
}

@end
