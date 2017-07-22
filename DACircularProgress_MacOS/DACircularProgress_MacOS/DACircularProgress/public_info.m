//
//  public_info.m
//  DACircularProgress_MacOS
//
//  Created by boo on 22/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "public_info.h"


@implementation public_info

static CGFloat progress=0;
static NSColor *trackTintColor;
static NSColor *progressTintColor;
static NSColor *innerTintColor;
static CGFloat thicknessRatio;
static BOOL roundedCorners;




+ (void)setProgress:(CGFloat)inputProgress{
    progress = inputProgress;
}
+ (CGFloat)progress{
    return progress;
}
+ (NSColor *)trackTintColor{
    return trackTintColor;
}
+ (void)setTrackTintColor:(NSColor *)input{
    trackTintColor = input;
}

+ (NSColor *)progressTintColor{
    return progressTintColor;
}
+ (void)setProgressTintColor:(NSColor *)input{
    progressTintColor = input;
}

+ (NSColor *)innerTintColor{
    return innerTintColor;
}
+ (void)setInnerTintColor:(NSColor *)input{
    innerTintColor = input;
}

+ (BOOL)roundedCorners{
    return roundedCorners;
}
+ (void)setRoundedCorners:(BOOL)input{
    roundedCorners =input;
}

+ (CGFloat)thicknessRatio{
    return thicknessRatio;
}
+ (void)setThicknessRatio:(CGFloat)input{
    thicknessRatio = input;
}






@end
