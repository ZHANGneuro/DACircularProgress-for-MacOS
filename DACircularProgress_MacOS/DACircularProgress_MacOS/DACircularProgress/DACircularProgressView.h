//
//  DACircularProgressView.h
//  DACircularProgress
//
//  Created by Daniel Amitay on 2/6/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//


#import <AppKit/AppKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CAlayer_subclass.h"
#import "public_info.h"

@interface DACircularProgressView : NSView

@property(nonatomic, strong) CAlayer_subclass *myCAlayer;
@property (strong, nonatomic) NSTextField *progressLabel;


- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated initialDelay:(CFTimeInterval)initialDelay;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated initialDelay:(CFTimeInterval)initialDelay withDuration:(CFTimeInterval)duration;

@end
