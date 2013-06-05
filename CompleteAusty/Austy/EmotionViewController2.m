//
//  EmotionViewController2.m
//  Austy
//
//  Created by Fredrick Awuah-Gyasi on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EmotionViewController2.h"

@interface EmotionViewController2 ()
@property(nonatomic) CGPoint selectedImageCenter;
@property(nonatomic) int counter1;
@end

@implementation EmotionViewController2

@synthesize present1=_present1;
@synthesize present2=_present2;
@synthesize present3=_present3;
@synthesize present4=_present4;
@synthesize present5=_present5;
@synthesize present6=_present6;
@synthesize present7=_present7;
@synthesize target1=_target1;
@synthesize target2=_target2;
@synthesize target6=_target6;
@synthesize target7=_target7;
@synthesize target4=_target4;
@synthesize target5=_target5;
@synthesize target3=_target3;
@synthesize hintImage1=_hintImage1;
@synthesize tommyHappyNormal=_tommyHappyNormal;
@synthesize instructionDisplay=_instructionDisplay;
@synthesize instruction=_instruction;
@synthesize tommySounds=_tommySounds;
@synthesize arrow = _arrow;
@synthesize arrow1 = _arrow1;
@synthesize arrow5 = _arrow5;
@synthesize arrow6 = _arrow6;
@synthesize arrow3 = _arrow3;
@synthesize arrow4 = _arrow4;
@synthesize arrow2 = _arrow2;
@synthesize mine=_mine;
@synthesize locationIndicators=_locationIndicators;

@synthesize  selectedImageCenter = _selectedImageCenter;
@synthesize counter1 = _counter1;

int const xOffset1 = 50;
int const yOffset1 = 30;
int const numberOfOptions1 = 7;

// Determine if dropPoint is in matchCenter boundaries
- (BOOL)isInCorrectPosition:(CGPoint)dropPoint:(CGPoint)matchCenter {
    if(dropPoint.x >= matchCenter.x-xOffset1 && dropPoint.x <= matchCenter.x+xOffset1 && 
       dropPoint.y >= matchCenter.y-yOffset1 && dropPoint.y <= matchCenter.y+yOffset1) {
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
        center = self.target1.center;
        view = self.target1;
    } else if (recognizer.view.tag == 1) {
        center = self.target2.center;
        view = self.target2;
    } else if(recognizer.view.tag == 2) {
        center = self.target3.center;
        view = self.target3;
    }else if(recognizer.view.tag == 3) {
        center = self.target4.center;
        view = self.target4;
    }else if(recognizer.view.tag == 4) {
        center = self.target5.center;
        view = self.target5;
    }else if(recognizer.view.tag == 5) {
        center = self.target6.center;
        view = self.target6;
    }else if(recognizer.view.tag == 6) {
        center = self.target7.center;
        view = self.target7;
    }
    
    
    
    
    //return center;
    return view;
}




- (void)handlePanEnded:(UIPanGestureRecognizer *)recognizer1 {
    // Get the position where image was dropped
    CGPoint dropPoint = recognizer1.view.center;
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizer1];
    CGPoint matchCenter = matchView.center;
    
    
    
    if([self isInCorrectPosition:dropPoint:matchCenter]&&(recognizer1.view.tag==self.counter1)&&self.counter1<=numberOfOptions1-1) {
        // Insert code image correctly dropped
        [self moveViewAnimated:recognizer1.view:matchCenter];
        recognizer1.view.userInteractionEnabled = NO;
        // Increment counter of correct images matched
        [self playmp3:(CFStringRef)@"drop"];
        
        self.counter1++;
        
        
        /*
         the laughter sound,played using the play method;
         
         */
        [self play:(CFStringRef) @"tommyHappyLaughterSound"];
        
        /*
         The happy face of tommy
         */
        self.tommyHappyNormal.image=[UIImage imageNamed:@"tommyHappy2.png"];
        [self locationdisappear:self.counter1];
        
        /*
         
         delay of next instruction
         
         */
        [self performSelector:@selector(secondDelay) withObject: nil afterDelay: 10.0];
        
        
        // Hide hint rectangle
        self.hintImage1.hidden = YES;
        matchView.hidden = YES;
        
    } else {
        // Insert code image incorrectly dropped
        [self moveViewAnimated:recognizer1.view:self.selectedImageCenter];
        self.hintImage1.hidden = YES;
    }
    
    
    /*
     Perform the segue after a delay of 6secs
     */
    
    [ self performSelector:@selector(delaySegue) withObject:nil afterDelay:6.0];
    
    
}
//=========================================================

/*
 Perform segue 
 */

-(void)delaySegue{
    if(self.counter1 == numberOfOptions1) {
        // Perform segue
        //self.counter1=0;
        [self performSegueWithIdentifier: @"emotion23segue" sender: self];
    }
    
    
}
//=========================================================

/*
 
 Display for the normal face after laughter
 
 */
-(void)displayNormalFace{
    
    self.tommyHappyNormal.image=[UIImage imageNamed:@"tommyNormal1.png"];
    
}
//=========================================================

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    
    
}


//=========================================================
/*
 To play the instructions 
 */

-(void)play:(CFStringRef ) resourceName{
    
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle,resourceName, CFSTR ("m4a"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}
//=========================================================

-(void)playmp3:(CFStringRef ) resourceName{
    
    CFBundleRef mainBundle= CFBundleGetMainBundle();
    CFURLRef soundFileURLRef;
    soundFileURLRef = CFBundleCopyResourceURL(mainBundle,resourceName, CFSTR ("mp3"), NULL);
    UInt32 soundID;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
    AudioServicesPlaySystemSound(soundID);
}



- (void)viewDidLoad


{
    
    
    
    
    //=========================================================   
    
    //self.arrow.alpha=0.0;
    
    
    /*
     
     the destination hint
     */
    
    
    self.locationIndicators=[NSArray arrayWithObjects:@"arrow",@"arrow1",@"arrow2",@"arrow3",@"arrow4",@"arrow5",@"arrow6", nil];
    
    
    /*
     the instructions:Text
     */
    self.instruction=[NSArray arrayWithObjects:
                      @"the Soccer ball",
                      @"the toy train",
                      @"the earthen tree turtle",
                      @"the wooden car",
                      @"the twisted candy",
                      @"his birthday cake",
                      @"the teddy bear",  nil];
    
    
    
    
    //=========================================================
    /*
     the instrucitons:Sound.
     
     */
    self.tommySounds=[NSArray arrayWithObjects:@"tommySoccerSound",
                      @"tommyToyTrainSound",
                      @"tommyEarthenTreeturtlesSound",
                      @"tommyWoodenCarSound",
                      @"tommyTwistedCandySound",
                      @"tommyBirthdayCakeSound",
                      @"tommyTeddyBearSound",nil];
    //=========================================================
    
    self.hintImage1.layer.cornerRadius = 9.0;
    self.hintImage1.layer.masksToBounds = YES;
    self.hintImage1.layer.borderColor = [UIColor blackColor].CGColor;
    self.hintImage1.layer.borderWidth = 5.0;
    self.hintImage1.layer.backgroundColor = [UIColor greenColor].CGColor;
    CGRect frame = self.hintImage1.frame;
    frame.size.width = 270;
    frame.size.height = 220;
    self.hintImage1.frame = frame;
    
    
    //=========================================================
    /*
     Initial Instruction:Text
     */
    self.instructionDisplay.text=[self.instruction objectAtIndex:self.counter1];
    //end of initial Instruction:Text
    //=========================================================
    /*
     Initial Instruction:Sound  
     */
    
    [self performSelector:@selector(delay) withObject: nil afterDelay: 2.0];
    //end of  initial Instruction:Sound
    //self.mine.alpha=0;
    //========================================================   
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}


//end
-(void)locationappear :(int) k{
    switch(k){
        case 0: {self.arrow.alpha=1;
            
            break;
        }
            
        case 1:{ self.arrow1.alpha=1;
            
            break;}
            
        case 2: {self.arrow2.alpha=1;
            
            break;}
            
        case 3: {self.arrow3.alpha=1;
            
            break;}
            
        case 4: {self.arrow4.alpha=1;
            break;}
            
        case 5: {self.arrow5.alpha=1;
            
            break;}
            
            
        case 6: {self.arrow6.alpha=1;
            
            break;}
    }
}

-(void)locationdisappear :(int) k{
    switch(k){
        default: {self.arrow6.alpha=0;
            
            break;
        }
            
        case 1:{ self.arrow.alpha=0;
            
            break;}
            
        case 2: {self.arrow1.alpha=0;
            
            break;}
            
        case 3: {self.arrow2.alpha=0;
            
            break;}
            
        case 4: {self.arrow3.alpha=0;
            break;}
            
        case 5: {self.arrow4.alpha=0;
            
            break;}
            
            
        case 6: {self.arrow5.alpha=0;
            
            break;}
    }
}

//=========================================================
/*
 Reference to the Instruction
 */
-(void)delay{
    [self play:(CFStringRef)[self.tommySounds objectAtIndex:self.counter1]];
    [self locationappear:self.counter1];
    
}//end
//=========================================================


//=========================================================
/*
 Play Instruction,Display instruction and Change Tommy's view
 
 */
-(void)secondDelay{
    if(self.counter1<numberOfOptions1){
        [self play:(CFStringRef)[self.tommySounds objectAtIndex:self.counter1]];
        
        self.instructionDisplay.text=[self.instruction objectAtIndex:self.counter1];
        [self locationappear:self.counter1];
        self.tommyHappyNormal.image=[UIImage imageNamed:@"tommyNormal1.png"];
    }
    
}
//=========================================================


- (void)viewDidUnload
{
    [self setPresent1:nil];
    [self setPresent2:nil];
    [self setPresent3:nil];
    [self setPresent4:nil];
    [self setPresent5:nil];
    [self setPresent6:nil];
    [self setPresent7:nil];
    [self setTarget1:nil];
    [self setTarget2:nil];
    [self setTarget6:nil];
    [self setTarget7:nil];
    [self setTarget4:nil];
    [self setTarget5:nil];
    [self setTarget3:nil];
    [self setHintImage1:nil];
    [self setTommyHappyNormal:nil];
    [self setInstructionDisplay:nil];
    [self setArrow:nil];
    [self setArrow1:nil];
    [self setArrow5:nil];
    [self setArrow6:nil];
    [self setArrow3:nil];
    [self setArrow4:nil];
    [self setArrow2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    return YES;
}


- (IBAction)close:(UIButton *)sender {
    //exit(1);
}

- (IBAction)handledPan:(UIPanGestureRecognizer *)recognizer1 {
    // If pan began
    if (recognizer1.state == UIGestureRecognizerStateBegan) {
        // Get the position where image was dragged
        self.selectedImageCenter = recognizer1.view.center;
    }
    
    CGPoint translation = [recognizer1 translationInView:self.view];
    recognizer1.view.center = CGPointMake(recognizer1.view.center.x + translation.x,recognizer1.view.center.y + translation.y);
    [recognizer1 setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // Show hint rectangle
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizer1];
    CGPoint matchCenter = matchView.center;
    if([self isInCorrectPosition:recognizer1.view.center:matchCenter]) {
        self.hintImage1.center = matchCenter;
        self.hintImage1.hidden = NO;
    } else {
        self.hintImage1.hidden = YES;
    }
    
    // If pan ended
    if (recognizer1.state == UIGestureRecognizerStateEnded) {
        [self handlePanEnded:recognizer1];
    }
    
}
@end
