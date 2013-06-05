//
//  VehiclesAndColorsViewController6.m
//  Austy
//
//  Created by Jose Picado on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VehiclesAndColorsViewController6.h"

@interface VehiclesAndColorsViewController6 ()
@property(nonatomic) int balloonNumber;
@property(nonatomic) int offset;
@end

@implementation VehiclesAndColorsViewController6
@synthesize balloonNumber = _balloonNumber;
@synthesize offset = _offset;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Play cheering sound
    [self play:(CFStringRef)@"KidsCheering"];
    
    // Initialize values
    self.balloonNumber = 1;
    self.offset = 200;
    
    // Call showBalloons
    [NSTimer scheduledTimerWithTimeInterval: 0.1 target:self selector:@selector(showBalloons:) userInfo:nil repeats: NO];
    
    // Wait 3 seconds and then perform segue
    [NSTimer scheduledTimerWithTimeInterval: 4.0 target:self selector:@selector(performSegue:) userInfo:nil repeats: NO];
    
}

- (void)play:(CFStringRef)resourceName{
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileURLRef = CFBundleCopyResourceURL(mainBundle, resourceName, CFSTR ("mp3"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

- (void) showBalloons:(NSTimer*)theTimer {
    
    // If balloonNumber == 1, image balloons1.png is used
    // If balloonNumber == -1, image balloons2.png is used
    // These numbers are exchanged each time showBalloons is called (so that different images are used each time)
    
    if(self.balloonNumber == 1) {
        UIBezierPath *trackPath = [UIBezierPath bezierPath];
        [trackPath moveToPoint:CGPointMake(self.offset, 800)];
        [trackPath addCurveToPoint:CGPointMake(self.offset, -100)
                     controlPoint1:CGPointMake(self.offset-100, 500)
                     controlPoint2:CGPointMake(self.offset+100, 300)];
        
        CALayer *balloonLayer = [CALayer layer];
        balloonLayer.bounds = CGRectMake(0, 0, 200.0, 150.0);
        balloonLayer.position = CGPointMake(self.offset, 800);
        balloonLayer.contents = (id)([UIImage imageNamed:@"balloons1.png"].CGImage);
        [self.view.layer addSublayer:balloonLayer];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        anim.path = trackPath.CGPath;
        //anim.rotationMode = kCAAnimationRotateAuto;
        anim.repeatCount = 2;
        anim.duration = 1.5;
        [balloonLayer addAnimation:anim forKey:@"anim"];
    } else {
        UIBezierPath *trackPath = [UIBezierPath bezierPath];
        [trackPath moveToPoint:CGPointMake(1200-self.offset, 800)];
        [trackPath addCurveToPoint:CGPointMake(1200-self.offset, -100)
                     controlPoint1:CGPointMake(1200-self.offset-100, 500)
                     controlPoint2:CGPointMake(1200-self.offset+100, 300)];
        
        CALayer *balloonLayer = [CALayer layer];
        balloonLayer.bounds = CGRectMake(0, 0, 200.0, 150.0);
        balloonLayer.position = CGPointMake(1200-self.offset, 800);
        balloonLayer.contents = (id)([UIImage imageNamed:@"balloons2.png"].CGImage);
        [self.view.layer addSublayer:balloonLayer];
        
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        anim.path = trackPath.CGPath;
        //anim.rotationMode = kCAAnimationRotateAuto;
        anim.repeatCount = 2;
        anim.duration = 1.5;
        [balloonLayer addAnimation:anim forKey:@"anim"];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showBalloons:) userInfo:nil repeats:NO];
    
    self.balloonNumber = self.balloonNumber * -1;
    self.offset = self.offset + 150;
}

- (void) performSegue:(NSTimer *)timer {
    // Perform segue
    [self performSegueWithIdentifier: @"vehiclesAndColorsSegue7" sender: self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
