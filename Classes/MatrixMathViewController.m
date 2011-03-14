//
//  MatrixMathViewController.m
//  MatrixMath
//
//  Created by Michael Berkovich on 3/8/11.
//  Copyright 2011 Geni.com. All rights reserved.
//

#import "MatrixMathViewController.h"

@implementation MatrixMathViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    moveFactor = CGPointMake(20.005, 20.005);
    scaleFactor = CGPointMake(40, 40);
    centerPoint = CGPointMake(160, 240);
    
    points = [[NSMutableArray alloc] initWithCapacity:8];
    [points addObject: [Point3D pointWithX: 1    y:-1    z:  1]];
    [points addObject: [Point3D pointWithX: 1    y: 1    z:  1]];
    [points addObject: [Point3D pointWithX: 1    y: 1    z: -1]];
    [points addObject: [Point3D pointWithX: 1    y:-1    z: -1]];
    [points addObject: [Point3D pointWithX:-1    y:-1    z: -1]];
    [points addObject: [Point3D pointWithX:-1    y: 1    z: -1]];
    [points addObject: [Point3D pointWithX:-1    y: 1    z:  1]];
    [points addObject: [Point3D pointWithX:-1    y:-1    z:  1]];
    
    views = [[NSMutableArray alloc] initWithCapacity:8];
    
    for (int i=0; i<[points count]; i++) {
        Point3D *p = (Point3D*)[points objectAtIndex:i];
        CGFloat x =(p.y * scaleFactor.x + centerPoint.x);
        CGFloat z =(p.z * scaleFactor.y + centerPoint.y);
        
        UILabel *v = [[UILabel alloc] initWithFrame:CGRectMake(x, z, 10, 10)];
        v.text = [NSString stringWithFormat:@"%d", i+1];
        v.font = [UIFont fontWithName:@"Arial" size:10];
        v.backgroundColor = [UIColor clearColor];
        
        [views addObject:v];
        [self.view addSubview:v];
        [v release];
    }
}

- (void) transform:(NSArray *)pts yrt:(CGFloat)yrt zrt:(CGFloat)zrt {
    if (pts==nil) return;
    
    CGFloat c1, s1, c2, s2;
    
    c1 = (CGFloat) cos(zrt);
    s1 = (CGFloat) sin(zrt);
    c2 = (CGFloat) cos(yrt);
    s2 = (CGFloat) sin(yrt);
    
    for (Point3D *p in pts) {
        float x = p.x * c1 * c2 - p.y * s2 - p.z * c2 * s1;
        float y = p.x * c1 * s2 + p.y * c2 - p.z * s1 * s2;
        float z = p.x * s1      + 0        + p.z * c1;
        
        p.x = x; 
        p.y = y; 
        p.z = z; 
    }
}

- (void) updateViews {
    for (int i=0; i<[points count]; i++) {
        Point3D *p = (Point3D*)[points objectAtIndex:i];
        UIView *v = (UIView*)[views objectAtIndex:i];

        CGFloat alpha = p.x + 1;
        if (alpha < 0.4) alpha = 0.4;
        
        v.alpha = alpha;
            
        CGFloat x =(p.y * scaleFactor.x + centerPoint.x);
        CGFloat z =(p.z * scaleFactor.y + centerPoint.y);
        [v setFrame: CGRectMake(x, z, 10, 10)];
    }
    [self.view setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch detected");
    UITouch *touch =[touches anyObject]; 
    lastLocPoint =[touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch moved");
    UITouch *touch =[touches anyObject]; 
    CGPoint newPoint = [touch locationInView:self.view];
    CGPoint delta = CGPointMake(0, 0);
    
    BOOL rotateFlag = NO;
    
    if (newPoint.x != lastLocPoint.x) {
        delta.x = (lastLocPoint.x - newPoint.x) / moveFactor.x;
        rotateFlag = YES;
    }
    
    if (newPoint.y != lastLocPoint.y) {
        delta.y = (lastLocPoint.y - newPoint.y) / moveFactor.y;
        rotateFlag = YES;
    }    
    
    if (rotateFlag) {
        NSLog(@"rotate(%f, %f)", delta.x, delta.y);
        [self transform: points yrt: delta.x zrt: delta.y];
        [self updateViews];
    }
    
    lastLocPoint = newPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch ended");
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"Touch canceled");
}

- (void)dealloc {
    [points release];
    [views release];
    [super dealloc];
}

@end
