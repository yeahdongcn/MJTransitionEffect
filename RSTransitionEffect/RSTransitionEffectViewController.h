//
//  RSTransitionEffectViewController.h
//  MJTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSBasicItem;

@interface RSTransitionEffectViewController : UIViewController

@property (nonatomic, strong) NSDictionary *sourceFrames;

@property (nonatomic, strong) NSDictionary *targetFrames;

@property (nonatomic, strong) RSBasicItem *item;

@property (nonatomic, weak) IBOutlet UIView *cell;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, weak) IBOutlet UILabel *textLabel;

@property (nonatomic, weak) IBOutlet UILabel *detailTextLabel;

@property (nonatomic, weak) IBOutlet UIView *backgroundView;

@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;

- (IBAction)close:(id)sender;

@end
