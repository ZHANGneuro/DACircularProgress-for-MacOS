//
//  AppDelegate.h
//  DACircularProgress_MacOS
//
//  Created by boo on 12/07/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DACircularProgressView.h"



@interface AppDelegate : NSObject <NSApplicationDelegate>



@property NSWindow *window;

@property (strong, nonatomic) DACircularProgressView *labeledProgressView;
@property (strong, nonatomic) NSTimer *timer;







@end

