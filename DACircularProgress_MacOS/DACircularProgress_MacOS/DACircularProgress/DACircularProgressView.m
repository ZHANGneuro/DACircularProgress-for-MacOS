//
//  DACircularProgressView.m
//  DACircularProgress
//
//  Created by Daniel Amitay on 2/6/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//
#import "DACircularProgressView.h"

@implementation DACircularProgressView


- (id)initWithFrame:(NSRect)frameRect{
    
    self = [super initWithFrame: frameRect];
    if (self) {
        [self setWantsLayer:YES];
//        _myCAlayer = [[CAlayer_subclass alloc] init];
        _myCAlayer = [CAlayer_subclass layer];
        [_myCAlayer setFrame:frameRect];
        
        [public_info setTrackTintColor:[[NSColor whiteColor] colorWithAlphaComponent:0.2f]];
        [public_info setProgressTintColor:[NSColor whiteColor]];
        [public_info setInnerTintColor:nil];
        [public_info setThicknessRatio:0.3f];
        [public_info setRoundedCorners:YES];
        [self setLayer:_myCAlayer];
        [self initializeLabel];
        return self;
    }
    return nil;
}


- (void)initializeLabel
{
    _progressLabel = [[NSTextField alloc] initWithFrame:CGRectMake(0, -35, self.frame.size.width, self.frame.size.height)];
    [_progressLabel setStringValue:[NSString stringWithFormat:@"%.2f",[public_info progress]]];
    [_progressLabel setEditable:NO];
    [_progressLabel setBordered:NO];
    [_progressLabel setFont:[NSFont fontWithName:@"Arial" size:25]];
    [_progressLabel setAlignment:NSTextAlignmentCenter];
    [_progressLabel setBackgroundColor:[NSColor clearColor]];
    [_progressLabel setTextColor:[NSColor whiteColor]];
    [self addSubview:_progressLabel];
}


- (CGFloat)progress
{
    return [public_info progress];
}

- (void)setProgress:(CGFloat)progress
{
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    [_progressLabel setStringValue:[NSString stringWithFormat:@"%.2f",[public_info progress]]];
    [self setProgress:progress animated:animated initialDelay:0.0];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated initialDelay:(CFTimeInterval)initialDelay
{
    CGFloat pinnedProgress = MIN(MAX(progress, 0.0f), 1.0f);
    [self setProgress:progress
             animated:animated
         initialDelay:initialDelay
         withDuration:fabs([public_info progress] - pinnedProgress)];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated initialDelay:(CFTimeInterval)initialDelay withDuration:(CFTimeInterval)duration
{
    [self.layer removeAnimationForKey:@"progress"];
    
    CGFloat pinnedProgress = MIN(MAX(progress, 0.0f), 1.0f);
    if (animated) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.fillMode = kCAFillModeForwards;
        animation.fromValue = [NSNumber numberWithFloat:self.progress];
        animation.toValue = [NSNumber numberWithFloat:pinnedProgress];
        animation.beginTime = CACurrentMediaTime() + initialDelay;
        [self.layer addAnimation:animation forKey:@"progress"];
        [self.layer setNeedsDisplay];
    }
    else {
        [self.layer setNeedsDisplay];
        self.progress = pinnedProgress;
    }
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag
{
   NSNumber *pinnedProgressNumber = [animation valueForKey:@"toValue"];
    [public_info setProgress:[pinnedProgressNumber floatValue]];
}







@end
