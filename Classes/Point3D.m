//
//  Point3D.m
//  MatrixMath
//
//  Created by Michael Berkovich on 3/8/11.
//  Copyright 2011 Geni.com. All rights reserved.
//

#import "Point3D.h"


@implementation Point3D
@synthesize x, y, z;

+ (Point3D *)pointWithX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z {
    Point3D *p = [[Point3D alloc] init];
    p.x = x;
    p.y = y;
    p.z = z;
    return [p autorelease];
}

@end
