//
//  RSCell.m
//  MJTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import "RSCell.h"

@interface RSCell ()

@property (nonatomic, assign) CGRect cellFrame;

@property (nonatomic, assign) CGRect cellImageViewFrame;

@property (nonatomic, assign) CGRect cellTextLabelFrame;

@property (nonatomic, assign) CGRect cellDetailTextLabelFrame;

- (void)__init;

@end

@implementation RSCell

#pragma mark - Private

- (void)__init
{
    [self addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    
    [self.imageView addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    
    [self.textLabel addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    
    [self.detailTextLabel addObserver:self forKeyPath:@"frame" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
}

#pragma mark - NSObject

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self __init];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame"];
    [self.imageView removeObserver:self forKeyPath:@"frame"];
    [self.textLabel removeObserver:self forKeyPath:@"frame"];
    [self.detailTextLabel removeObserver:self forKeyPath:@"frame"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self && [keyPath isEqualToString:@"frame"]) {
        self.cellFrame = self.frame;
    } else if (object == self.imageView && [keyPath isEqualToString:@"frame"]) {
        self.cellImageViewFrame = self.imageView.frame;
    } else if (object == self.textLabel && [keyPath isEqualToString:@"frame"]) {
        self.cellTextLabelFrame = self.textLabel.frame;
    } else if (object == self.detailTextLabel && [keyPath isEqualToString:@"frame"]) {
        self.cellDetailTextLabelFrame = self.detailTextLabel.frame;
    }
}

#pragma mark - UITableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self __init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
