//
//  Point3D.h
//  MatrixMath
//
//  Created by Michael Berkovich on 3/8/11.
//  Copyright 2011 Geni.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Point3D : NSObject {
    CGFloat x;
    CGFloat y;
    CGFloat z;
}

@property(nonatomic) CGFloat x;
@property(nonatomic) CGFloat y;
@property(nonatomic) CGFloat z;


+ (Point3D *)pointWithX:(CGFloat)x y:(CGFloat)y z:(CGFloat)z;

@end
