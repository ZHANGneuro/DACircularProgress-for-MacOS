//
//  AppDelegate.m
//  DACircularProgress_MacOS
//
//  Created by boo on 12/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize window, labeledProgressView, timer;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    int appheight = [[NSScreen mainScreen] frame].size.height;
    NSRect frame = NSMakeRect(100, 100, 150, 150);
    NSUInteger masks = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskBorderless;
    window = [[NSWindow alloc] initWithContentRect:frame styleMask:masks backing:NSBackingStoreBuffered defer:NO];
    [window makeKeyAndOrderFront:NSApp];
    [window setTitlebarAppearsTransparent:NO];
    [window setMaxSize:NSMakeSize(420, appheight)];
    [window setMinSize:NSMakeSize(420, appheight/2)];
    [window.contentView setCanDrawConcurrently:YES];
    window.backgroundColor = [NSColor colorWithCalibratedRed:(255/255.0f) green:(255/255.0f) blue:(255/255.0f) alpha:1.0f];
    
    self.labeledProgressView = [[DACircularProgressView alloc] initWithFrame:CGRectMake(25, 25, 100, 100)];
    
    [window.contentView setWantsLayer:YES];
    [window.contentView.layer setBackgroundColor:[NSColor grayColor].CGColor];
    [window.contentView addSubview:self.labeledProgressView];
    [self startAnimation];
}


- (void)startAnimation{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.03
                                             target:self
                                           selector:@selector(progressChange)
                                           userInfo:nil
                                            repeats:YES];
}


- (void)progressChange{
    CGFloat progress = [public_info progress] + 0.02f;
    [public_info setProgress:progress];
    
    [labeledProgressView setProgress:progress animated:YES];
    if ([public_info progress] >= 1.0f && [self.timer isValid]) {
        [public_info setProgress:0];
        [labeledProgressView setProgress:0.f animated:YES];
    }
}


- (void)stopAnimation
{
    [self.timer invalidate];
    self.timer = nil;
}


@end
