//
//  CAlayer_subclass.m
//  DACircularProgress_MacOS
//
//  Created by boo on 21/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "CAlayer_subclass.h"

@implementation CAlayer_subclass

- (id)init {
    self = [super init];
    if (self) {
        [self setNeedsDisplay];
    }
    return self;
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else {
        return [super needsDisplayForKey:key];
    }
}

- (void)drawInContext:(CGContextRef)context
{
    CGRect rect = self.bounds;
    CGPoint centerPoint = CGPointMake(rect.size.width / 2.0f, rect.size.height / 2.0f);
    CGFloat radius = MIN(rect.size.height, rect.size.width) / 2.0f;
    
    CGFloat progress = MIN([public_info progress], 1.0f - FLT_EPSILON);
    CGFloat radians = 0;
    
    radians = (float)(M_PI_2 - (progress * 2.0f * M_PI));
    
    CGContextSetFillColorWithColor(context, [public_info trackTintColor].CGColor);
    CGMutablePathRef trackPath = CGPathCreateMutable();
    CGPathMoveToPoint(trackPath, NULL, centerPoint.x, centerPoint.y);
    CGPathAddArc(trackPath, NULL, centerPoint.x, centerPoint.y, radius, (float)(2.0f * M_PI), 0.0f, TRUE);
    CGPathCloseSubpath(trackPath);
    CGContextAddPath(context, trackPath);
    CGContextFillPath(context);
    CGPathRelease(trackPath);
    
    if (progress > 0.0f) {
        CGContextSetFillColorWithColor(context, [public_info progressTintColor].CGColor);
        CGMutablePathRef progressPath = CGPathCreateMutable();
        CGPathMoveToPoint(progressPath, NULL, centerPoint.x, centerPoint.y);
        CGPathAddArc(progressPath, NULL, centerPoint.x, centerPoint.y, radius, M_PI_2, radians, YES);
        CGPathCloseSubpath(progressPath);
        CGContextAddPath(context, progressPath);
        CGContextFillPath(context);
        CGPathRelease(progressPath);
    }
    
    if (progress > 0.0f && [public_info roundedCorners]) {
        CGFloat pathWidth = radius * [public_info thicknessRatio];
        CGFloat xOffset = radius * (1.0f + ((1.0f - ([public_info thicknessRatio] / 2.0f)) * cosf(radians)));
        CGFloat yOffset = radius * (1.0f + ((1.0f - ([public_info thicknessRatio] / 2.0f)) * sinf(radians)));
        CGPoint endPoint = CGPointMake(xOffset, yOffset);
        
        CGRect startEllipseRect = (CGRect) {
            .origin.x = centerPoint.x - pathWidth / 2.0f,
            .origin.y = 2 * centerPoint.y - pathWidth,
            .size.width = pathWidth,
            .size.height = pathWidth
        };
        CGContextAddEllipseInRect(context, startEllipseRect);
        CGContextFillPath(context);
        
        CGRect endEllipseRect = (CGRect) {
            .origin.x = endPoint.x - pathWidth / 2.0f,
            .origin.y = endPoint.y - pathWidth / 2.0f,
            .size.width = pathWidth,
            .size.height = pathWidth
        };
        CGContextAddEllipseInRect(context, endEllipseRect);
        CGContextFillPath(context);
    }
    
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGFloat innerRadius = radius * (1.0f - [public_info thicknessRatio]);
    CGRect clearRect = (CGRect) {
        .origin.x = centerPoint.x - innerRadius,
        .origin.y = centerPoint.y - innerRadius,
        .size.width = innerRadius * 2.0f,
        .size.height = innerRadius * 2.0f
    };
    CGContextAddEllipseInRect(context, clearRect);
    CGContextFillPath(context);
    
    if ([public_info innerTintColor]) {
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        CGContextSetFillColorWithColor(context, [public_info innerTintColor].CGColor);
//        CGContextAddEllipseInRect(context, clearRect);
        CGContextFillPath(context);
    }
}


@end
