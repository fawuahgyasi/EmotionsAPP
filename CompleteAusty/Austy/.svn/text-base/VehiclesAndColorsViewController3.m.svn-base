//
//  VehiclesAndColorsViewController3.m
//  Austy
//
//  Created by Jose Picado on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VehiclesAndColorsViewController3.h"

@interface VehiclesAndColorsViewController3 ()
@property(nonatomic) CGPoint selectedImageCenter;
@property(nonatomic) int counter;
@end


@implementation VehiclesAndColorsViewController3
@synthesize match1;
@synthesize match2;
@synthesize match3;
@synthesize option1;
@synthesize option2;
@synthesize option3;
@synthesize hintImage;

@synthesize  selectedImageCenter = _selectedImageCenter;
@synthesize counter = _counter;

int const xOffset3 = 50;
int const yOffset3 = 30;
int const numberOfOptions3 = 3;

// Determine if dropPoint is in matchCenter boundaries
- (BOOL)isInCorrectPosition:(CGPoint)dropPoint:(CGPoint)matchCenter {
    if(dropPoint.x >= matchCenter.x-xOffset3 && dropPoint.x <= matchCenter.x+xOffset3 && 
       dropPoint.y >= matchCenter.y-yOffset3 && dropPoint.y <= matchCenter.y+yOffset3) {
        return YES;
    } else
        return NO;
}

// Move view to specified position, animated
- (void)moveViewAnimated:(UIView *)view: (CGPoint)destPosition {
    [UIView beginAnimations:nil context:nil]; 
    [UIView setAnimationDuration:0.5];
    view.center = destPosition;
    [UIView commitAnimations];
}

- (UIView *)getViewFromCorreponsingMatch:(UIPanGestureRecognizer *)recognizer {
    CGPoint center;
    UIView *view;
    // Determine which option was panned
    // Get position of corresponding match
    if(recognizer.view.tag == 0) {
        center = self.match3.center;
        view = self.match3;
    } else if (recognizer.view.tag == 1) {
        center = self.match1.center;
        view = self.match1;
    } else if(recognizer.view.tag == 2) {
        center = self.match2.center;
        view = self.match2;
    }
    //return center;
    return view;
}

- (void)handlePanEnded:(UIPanGestureRecognizer *)recognizer {
    // Get the position where image was dropped
    CGPoint dropPoint = recognizer.view.center;
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizer];
    CGPoint matchCenter = matchView.center;
    
    if([self isInCorrectPosition:dropPoint:matchCenter]) {
        // Play drop sound
        [self play:(CFStringRef)@"drop"];
        // Insert code image correctly dropped
        [self moveViewAnimated:recognizer.view:matchCenter];
        recognizer.view.userInteractionEnabled = NO;
        // Increment counter of correct images matched
        self.counter++;
        // Hide hint rectangle
        self.hintImage.hidden = YES;
        matchView.hidden = YES;
        
    } else {
        // Insert code image incorrectly dropped
        [self moveViewAnimated:recognizer.view:self.selectedImageCenter];
    }
    
    // If all options have been matched, go to next screen
    if(self.counter == numberOfOptions3) {
        [self finishScene];
    }
}

- (void)finishScene {
    [self play:(CFStringRef)@"planeSound"];
    
    // Perform animations
    [self performLastAnimations];
    
    // Perform segue
    //[self performSegueWithIdentifier: @"vehiclesAndColorsSegue4" sender: self];
}

- (void)performLastAnimations {
    
    // Animation for option1
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:self.option1.center];
	[path1 addCurveToPoint:CGPointMake(1100, 100)
             controlPoint1:CGPointMake(900, 250)
             controlPoint2:CGPointMake(1000, 200)];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim.path = path1.CGPath;
	anim.rotationMode = kCAAnimationRotateAuto;
	anim.duration = 3.0;
	[self.option1.layer addAnimation:anim forKey:@"anim"];
    
    // Animation for option2
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    [path2 moveToPoint:self.option2.center];
	[path2 addCurveToPoint:CGPointMake(800, -100)
             controlPoint1:CGPointMake(400, 150)
             controlPoint2:CGPointMake(600, 50)];
    
    CAKeyframeAnimation *anim2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim2.path = path2.CGPath;
	anim2.rotationMode = kCAAnimationRotateAuto;
	anim2.duration = 3.0;
	[self.option2.layer addAnimation:anim2 forKey:@"anim"];
    
    // Animation for option3
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    
    [path3 moveToPoint:self.option3.center];
	[path3 addCurveToPoint:CGPointMake(-100, -100)
             controlPoint1:CGPointMake(300, 100)
             controlPoint2:CGPointMake(100, 50)];
    
    CAKeyframeAnimation *anim3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim3.path = path3.CGPath;
	anim3.rotationMode = kCAAnimationRotateAutoReverse;
	anim3.duration = 3.0;
	[self.option3.layer addAnimation:anim3 forKey:@"anim"];
    
    // Wait 3 seconds and then perform segue
    [NSTimer scheduledTimerWithTimeInterval: 2.5 target:self selector:@selector(performSegue:) userInfo:nil repeats: NO];
    
}

- (void) performSegue:(NSTimer *)timer {
    // Perform segue
    [self performSegueWithIdentifier: @"vehiclesAndColorsSegue4" sender: self];
}


- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    // If pan began
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // Get the position where image was dragged
        self.selectedImageCenter = recognizer.view.center;
    }
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // Show hint rectangle
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizer];
    CGPoint matchCenter = matchView.center;
    if([self isInCorrectPosition:recognizer.view.center:matchCenter]) {
        self.hintImage.center = matchCenter;
        self.hintImage.hidden = NO;
    } else {
        self.hintImage.hidden = YES;
    }
    
    // If pan ended
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self handlePanEnded:recognizer];
    }
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.hintImage.layer.cornerRadius = 9.0;
    self.hintImage.layer.masksToBounds = YES;
    self.hintImage.layer.borderColor = [UIColor blackColor].CGColor;
    self.hintImage.layer.borderWidth = 5.0;
    self.hintImage.layer.backgroundColor = [UIColor greenColor].CGColor;
    CGRect frame = self.hintImage.frame;
    frame.size.width = 270;
    frame.size.height = 220;
    self.hintImage.frame = frame;
}


- (void)viewDidUnload
{
    [self setMatch1:nil];
    [self setMatch2:nil];
    [self setMatch3:nil];
    [self setOption1:nil];
    [self setOption2:nil];
    [self setOption3:nil];
    [self setHintImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

// Play sounds
- (void)play:(CFStringRef)resourceName{
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileURLRef = CFBundleCopyResourceURL(mainBundle, resourceName, CFSTR ("mp3"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

@end

