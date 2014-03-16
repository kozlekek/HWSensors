//
//  NSWindow+BackgroundGaussianBlur.m
//  HWMonitor
//
//  Created by Kozlek on 15.03.14.
//  Copyright (c) 2014 Guilherme Rambo, kozlek. All rights reserved.
//

// Original article: http://stackoverflow.com/questions/19575642/how-to-use-cifilter-on-nswindow-in-osx-10-9-mavericks

#import "NSWindow+BackgroundBlur.h"

typedef void *          CGSConnection;

extern CGSConnection    CGSDefaultConnectionForThread();
extern OSStatus         CGSSetWindowBackgroundBlurRadius(CGSConnection connection, NSInteger windowNumber, int radius);

@implementation NSWindow (BackgroundBlur)

- (void)setBackgroundBlurRadius:(NSInteger)radius
{
    if (self.isVisible) {
        //[self setOpaque:NO];
        CGSConnection connection = CGSDefaultConnectionForThread();
        CGSSetWindowBackgroundBlurRadius(connection, self.windowNumber, (int)radius);
    }
}

@end