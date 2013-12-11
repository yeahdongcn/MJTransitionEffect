//
//  UITableView+Frames.m
//  MJTransitionEffect
//
//  Created by R0CKSTAR on 12/11/13.
//  Copyright (c) 2013 mayur. All rights reserved.
//

#import "UITableView+Frames.h"

@implementation UITableView (Frames)

- (NSDictionary *)framesForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
    CGRect cellFrameInTableView = [self rectForRowAtIndexPath:indexPath];
    CGRect cellFrameInWindow = [self convertRect:cellFrameInTableView toView:[UIApplication sharedApplication].keyWindow];
    NSMutableDictionary *frames = [NSMutableDictionary dictionary];
    [frames setObject:[NSValue valueWithCGRect:cellFrameInWindow] forKey:@"cell"];
    [frames setObject:[NSValue valueWithCGRect:CGRectZero] forKey:@"imageView"];
    [frames setObject:[NSValue valueWithCGRect:CGRectZero] forKey:@"textLabel"];
    [frames setObject:[NSValue valueWithCGRect:CGRectZero] forKey:@"detailTextLabel"];
    return [NSDictionary dictionaryWithDictionary:frames];
}

@end
