//
//  LettersViewController.m
//  Austy
//
//  Created by Andrew Proctor on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LettersViewController.h"

@interface LettersViewController ()
@property(nonatomic) CGPoint selectedImageCenter;
@property(nonatomic) int counter;
@end

@implementation LettersViewController
@synthesize match1 = _match1;
@synthesize match2 = _match2;
@synthesize option1 = _option1;
@synthesize option2 = _option2;
@synthesize option3 = _option3;
@synthesize option4 = _option4;
@synthesize option5 = _option5;
@synthesize hintImage = _hintImage;

@synthesize  selectedImageCenter = _selectedImageCenter;
@synthesize counter = _counter;

int const xOffsetLetters = 50;
int const yOffsetLetters = 30;
int const numberOfOptionsLetters = 5;


-(void)randomizeImages{
    
    int index = arc4random() % 52 + 1;
    NSString *fileName = [NSString stringWithFormat:@"%i.png", index];
    _option1.image = [UIImage imageNamed:fileName ];
    _option1.tag = index;
    
    index = arc4random() % 52 + 1;
    fileName = [NSString stringWithFormat:@"%i.png", index];
    _option2.image = [UIImage imageNamed:fileName ];
    _option2.tag = index;
    
    index = arc4random() % 52 + 1;
    fileName = [NSString stringWithFormat:@"%i.png", index];
    _option3.image = [UIImage imageNamed:fileName ];
    _option3.tag = index;
    
    index = arc4random() % 52 + 1;
    fileName = [NSString stringWithFormat:@"%i.png", index];
    _option4.image = [UIImage imageNamed:fileName ];
    _option4.tag = index;
    
    index = arc4random() % 52 + 1;
    fileName = [NSString stringWithFormat:@"%i.png", index];
    _option5.image = [UIImage imageNamed:fileName ];
    _option5.tag = index;
    
}

-(void)randomizePositions{
    
    int xVal = arc4random() % 200 + 25;
    int yVal = arc4random() % 500 + 25;
    _option1.center = CGPointMake(xVal, yVal);
    
    xVal = arc4random() % 200 + 200;
    yVal = arc4random() % 350 + 25;
    _option2.center = CGPointMake(xVal, yVal);
    
    xVal = arc4random() % 200 + 400;
    yVal = arc4random() % 300 + 25;
    _option3.center = CGPointMake(xVal, yVal);
    
    xVal = arc4random() % 200 + 600;
    yVal = arc4random() % 350 + 25;
    _option4.center = CGPointMake(xVal, yVal);
    
    xVal = arc4random() % 200 + 800;
    yVal = arc4random() % 500 + 25;
    _option5.center = CGPointMake(xVal, yVal);
}

// Determine if dropPoint is in matchCenter boundaries
- (BOOL)isInCorrectPosition:(CGPoint)dropPoint:(CGPoint)matchCenter {
    if(dropPoint.x >= matchCenter.x-xOffsetLetters && dropPoint.x <= matchCenter.x+xOffsetLetters && 
       dropPoint.y >= matchCenter.y-yOffsetLetters && dropPoint.y <= matchCenter.y+yOffsetLetters) {
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

- (UIView *)getViewFromCorreponsingMatch:(UIPanGestureRecognizer *)recognizerl {
    CGPoint center;
    UIView *view;
    // Determine which option was panned
    // Get position of corresponding match
    if(recognizerl.view.tag % 2 == 1) {
        center = self.match2.center;
        view = self.match2;
    }else if(recognizerl.view.tag % 2 == 0) {
        center = self.match1.center;
        view = self.match1;
    }
    
    //return center;
    return view;
}

- (void)handlePanEnded:(UIPanGestureRecognizer *)recognizerl {
    // Get the position where image was dropped
    CGPoint dropPoint = recognizerl.view.center;
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizerl];
    CGPoint matchCenter = matchView.center;
    
    if([self isInCorrectPosition:dropPoint:matchCenter]) {
        // Insert code image correctly dropped
        [self moveViewAnimated:recognizerl.view:matchCenter];
        recognizerl.view.userInteractionEnabled = NO;
        // Increment counter of correct images matched
        self.counter++;
        // Hide hint rectangle
        self.hintImage.hidden = YES;
        
        // matchView.hidden = YES;
    } else {
        // Insert code image incorrectly dropped
        [self moveViewAnimated:recognizerl.view:self.selectedImageCenter];
    }
    
    // If all options have been matched, go to next screen
    if(self.counter == numberOfOptionsLetters) {
        //[self play:(CFStringRef)@"KidsCheering"];
        
        [self performLastAnimations];
        
        // Wait 3 seconds and then perform segue
        //[NSTimer scheduledTimerWithTimeInterval: 2.5 target:self selector:@selector(performSegue:) userInfo:nil repeats: NO];
        // Perform segue
        //[self performSegueWithIdentifier: @"vehiclesAndColorsSegue2" sender: self];
    }
}

- (void)performLastAnimations {
    
    // Animation for option1
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    
    [path1 moveToPoint:self.option1.center];
	[path1 addCurveToPoint:CGPointMake(0, 500)
             controlPoint1:CGPointMake(250, 150)
             controlPoint2:CGPointMake(150, 300)];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim.path = path1.CGPath;
	anim.rotationMode = kCAAnimationRotateAutoReverse;
	anim.duration = 3.0;
	[self.option1.layer addAnimation:anim forKey:@"anim"];
    
    // Animation for option2
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    
    [path2 moveToPoint:self.option2.center];
	[path2 addCurveToPoint:CGPointMake(1200, 300)
             controlPoint1:CGPointMake(900, 250)
             controlPoint2:CGPointMake(1000, 275)];
    
    CAKeyframeAnimation *anim2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim2.path = path2.CGPath;
	anim2.rotationMode = kCAAnimationRotateAuto;
	anim2.duration = 5.0;
	[self.option2.layer addAnimation:anim2 forKey:@"anim"];
    
    // Animation for option3
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    
    [path3 moveToPoint:self.option3.center];
	[path3 addCurveToPoint:CGPointMake(800, -100)
             controlPoint1:CGPointMake(400, 150)
             controlPoint2:CGPointMake(600, 50)];
    
    CAKeyframeAnimation *anim3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim3.path = path3.CGPath;
	anim3.rotationMode = kCAAnimationRotateAuto;
	anim3.duration = 3.0;
	[self.option3.layer addAnimation:anim3 forKey:@"anim"];
    
    // Animation for option4
    UIBezierPath *path4 = [UIBezierPath bezierPath];
    
    [path4 moveToPoint:self.option4.center];
	[path4 addCurveToPoint:CGPointMake(1100, 500)
             controlPoint1:CGPointMake(600, 150)
             controlPoint2:CGPointMake(800, 300)];
    
    CAKeyframeAnimation *anim4 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim4.path = path4.CGPath;
	anim4.rotationMode = kCAAnimationRotateAutoReverse;
	anim4.duration = 3.0;
	[self.option4.layer addAnimation:anim4 forKey:@"anim"];
    
    // Animation for option5
    UIBezierPath *path5 = [UIBezierPath bezierPath];
    
    [path5 moveToPoint:self.option5.center];
	[path5 addCurveToPoint:CGPointMake(1200, 300)
             controlPoint1:CGPointMake(900, 250)
             controlPoint2:CGPointMake(1000, 275)];
    
    CAKeyframeAnimation *anim5 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim5.path = path5.CGPath;
	anim5.rotationMode = kCAAnimationRotateAuto;
	anim5.duration = 3.0;
	[self.option5.layer addAnimation:anim5 forKey:@"anim"];
    
    // Wait 3 seconds and then perform segue
    [NSTimer scheduledTimerWithTimeInterval: 5 target:self selector:@selector(performSegue:) userInfo:nil repeats: NO];
    
}

- (void) performSegue:(NSTimer *)timer {
    // Perform segue
    [self performSegueWithIdentifier: @"lettersSegue1" sender: self];
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizerl {
    
    // If pan began
    if (recognizerl.state == UIGestureRecognizerStateBegan) {
        // Get the position where image was dragged
        [self play:(CFStringRef)@"drop"];
        self.selectedImageCenter = recognizerl.view.center;
    }
    
    CGPoint translation = [recognizerl translationInView:self.view];
    recognizerl.view.center = CGPointMake(recognizerl.view.center.x + translation.x,recognizerl.view.center.y + translation.y);
    [recognizerl setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // Show hint rectangle
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizerl];
    CGPoint matchCenter = matchView.center;
    if([self isInCorrectPosition:recognizerl.view.center:matchCenter]) {
        self.hintImage.center = matchCenter;
        self.hintImage.hidden = NO;
    } else {
        self.hintImage.hidden = YES;
    }
    
    // If pan ended
    if (recognizerl.state == UIGestureRecognizerStateEnded) {
        [self handlePanEnded:recognizerl];
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

- (void)play:(CFStringRef)resourceName{
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileURLRef = CFBundleCopyResourceURL(mainBundle, resourceName, CFSTR ("mp3"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self randomizeImages];
    [self randomizePositions];
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
    [self setOption1:nil];
    [self setOption2:nil];
    [self setOption3:nil];
    [self setHintImage:nil];
    [self setOption4:nil];
    [self setOption5:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
