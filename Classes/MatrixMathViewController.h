//
//  MatrixMathViewController.h
//  MatrixMath
//
//  Created by Michael Berkovich on 3/8/11.
//  Copyright 2011 Geni.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Point3D.h"


@interface MatrixMathViewController : UIViewController {
    NSMutableArray *points;
    NSMutableArray *views;

    CGPoint lastLocPoint;
    CGPoint centerPoint;
    CGPoint moveFactor;
    CGPoint scaleFactor;
    
}

@end

