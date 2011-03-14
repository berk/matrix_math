//
//  MatrixMathAppDelegate.m
//  MatrixMath
//
//  Created by Michael Berkovich on 3/8/11.
//  Copyright 2011 Geni.com. All rights reserved.
//

#import "MatrixMathAppDelegate.h"
#import "MatrixMathViewController.h"

@implementation MatrixMathAppDelegate

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
