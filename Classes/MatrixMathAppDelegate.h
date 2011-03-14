//
//  MatrixMathAppDelegate.h
//  MatrixMath
//
//  Created by Michael Berkovich on 3/8/11.
//  Copyright 2011 Geni.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MatrixMathViewController;

@interface MatrixMathAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MatrixMathViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MatrixMathViewController *viewController;

@end

