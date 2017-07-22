//
//  public_info.h
//  DACircularProgress_MacOS
//
//  Created by boo on 22/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface public_info : NSObject

+ (CGFloat)progress;
+ (void)setProgress:(CGFloat)inputProgress;

+ (NSColor *)trackTintColor;
+ (void)setTrackTintColor:(NSColor *)input;

+ (NSColor *)progressTintColor;
+ (void)setProgressTintColor:(NSColor *)input;

+ (NSColor *)innerTintColor;
+ (void)setInnerTintColor:(NSColor *)input;

+ (BOOL)roundedCorners;
+ (void)setRoundedCorners:(BOOL)input;

+ (CGFloat)thicknessRatio;
+ (void)setThicknessRatio:(CGFloat)input;






@end
