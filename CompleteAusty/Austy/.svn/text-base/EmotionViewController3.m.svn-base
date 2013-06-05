//
//  EmotionViewController3.m
//  Austy
//
//  Created by Fredrick Awuah-Gyasi on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EmotionViewController3.h"

@interface EmotionViewController3 ()
@property(nonatomic) CGPoint selectedImageCenter;
@property(nonatomic) int counter1;
@end

@implementation EmotionViewController3
@synthesize present1a=_present1a;
@synthesize present2a=_present2a;
@synthesize present3a=_present3a;
@synthesize present4a=_present4a;
@synthesize present5a=_present5a;
@synthesize present6a=_present6a;
@synthesize present7a=_present7a;
@synthesize target1a=_target1a;
@synthesize arrowa = _arrowa;
@synthesize target2a=_target2a;
@synthesize arrow1a = _arrow1a;
@synthesize target6a=_target6a;
@synthesize arrow5a = _arrow5a;
@synthesize target7a=_target7a;
@synthesize arrow6a = _arrow6a;
@synthesize target4a=_target4a;
@synthesize arrow3a = _arrow3a;
@synthesize target5a=_target5a;
@synthesize arrow4a = _arrow4a;
@synthesize target3a=_target3a;
@synthesize arrow2a = _arrow2a;
@synthesize hintImage1a=_hintImage1a;
@synthesize tommySadNormal=_tommySadNormal;
@synthesize instructionDisplaySad=_instructionDisplaySad;
@synthesize instruction1=_instruction1;
@synthesize tommySounds1=_tommySounds1;




@synthesize  selectedImageCenter = _selectedImageCenter;
@synthesize counter1 = _counter1;

int const xOffset11 = 50;
int const yOffset11 = 30;
int const numberOfOptions11 = 7;


//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}
//


// Determine if dropPoint is in matchCenter boundaries
- (BOOL)isInCorrectPosition:(CGPoint)dropPoint:(CGPoint)matchCenter {
    if(dropPoint.x >= matchCenter.x-xOffset11 && dropPoint.x <= matchCenter.x+xOffset11 && 
       dropPoint.y >= matchCenter.y-yOffset11 && dropPoint.y <= matchCenter.y+yOffset11) {
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
        center = self.target1a.center;
        view = self.target1a;
    } else if (recognizer.view.tag == 1) {
        center = self.target2a.center;
        view = self.target2a;
    } else if(recognizer.view.tag == 2) {
        center = self.target3a.center;
        view = self.target3a;
    }else if(recognizer.view.tag == 3) {
        center = self.target4a.center;
        view = self.target4a;
    }else if(recognizer.view.tag == 4) {
        center = self.target5a.center;
        view = self.target5a;
    }else if(recognizer.view.tag == 5) {
        center = self.target6a.center;
        view = self.target6a;
    }else if(recognizer.view.tag == 6) {
        center = self.target7a.center;
        view = self.target7a;
    }
    
    
    
    
    //return center;
    return view;
}




- (void)handlePanEnded:(UIPanGestureRecognizer *)recognizer1 {
    // Get the position where image was dropped
    CGPoint dropPoint = recognizer1.view.center;
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizer1];
    CGPoint matchCenter = matchView.center;
    
    
    
    if([self isInCorrectPosition:dropPoint:matchCenter]&&(recognizer1.view.tag==self.counter1)&&self.counter1<=numberOfOptions11-1) {
        // Insert code image correctly dropped
        [self moveViewAnimated:recognizer1.view:matchCenter];
        recognizer1.view.userInteractionEnabled = NO;
        // Increment counter of correct images matched
        [self playmp3:(CFStringRef)@"drop"];
        
        self.counter1++;
        
        
        /*
         the sad sound,played using the play method;
         
         */
        [self play:(CFStringRef) @"tommySadCryingSound"];
        
        /*
         The sad face of tommy
         */
        self.tommySadNormal.image=[UIImage imageNamed:@"tommySad1.png"];
        [self locationdisappear:self.counter1];
        
        
        /*
         
         delay of next instruction
         
         */
        [self performSelector:@selector(secondDelay) withObject: nil afterDelay: 14.0];
        
        
        // Hide hint rectangle
        self.hintImage1a.hidden = YES;
        matchView.hidden = YES;
        
    } else {
        // Insert code image incorrectly dropped
        [self moveViewAnimated:recognizer1.view:self.selectedImageCenter];
        self.hintImage1a.hidden = YES;
    }
    
    
    /*
     Perform the segue after a delay of 6secs
     */
    
    [ self performSelector:@selector(delaySegue) withObject:nil afterDelay:14.0];
    
    
}
//=========================================================

/*
 Perform segue 
 */

-(void)delaySegue{
    if(self.counter1 == numberOfOptions11) {
        // Perform segue
        //self.counter1=0;
        [self performSegueWithIdentifier: @"emotion31segue" sender: self];
    }
    
    
}
//=========================================================

/*
 
 Display for the normal face after laughter
 
 */
-(void)displayNormalFace{
    
    self.tommySadNormal.image=[UIImage imageNamed:@"tommyNormal1.png"];
    
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
    /*
     the instructions:Text
     */
    self.instruction1=[NSArray arrayWithObjects:
                       @"the Soccer ball",
                       @"the toy tain",
                       @"the earthen tree turtle",
                       @"the wooden car",
                       @"the twisted candy",
                       @"his birthday cake",
                       @"the teddy bear",  nil];
    //=========================================================
    /*
     the instrucitons:Sound.
     
     */
    self.tommySounds1=[NSArray arrayWithObjects:@"tommySoccerSadSound",
                       @"tommyToyTrainSadSound",
                       @"tommyEarthenTreeturtlesSadSound",
                       @"tommyWoodenCarSadSound",
                       @"tommyTwistedCandySadSound",
                       @"tommyBirthdayCakeSadSound",
                       @"tommyTeddyBearSadSound",nil];
    //=========================================================
    
    self.hintImage1a.layer.cornerRadius = 9.0;
    self.hintImage1a.layer.masksToBounds = YES;
    self.hintImage1a.layer.borderColor = [UIColor blackColor].CGColor;
    self.hintImage1a.layer.borderWidth = 5.0;
    self.hintImage1a.layer.backgroundColor = [UIColor greenColor].CGColor;
    CGRect frame = self.hintImage1a.frame;
    frame.size.width = 270;
    frame.size.height = 220;
    self.hintImage1a.frame = frame;
    
    
    //=========================================================
    /*
     Initial Instruction:Text
     */
    self.instructionDisplaySad.text=[self.instruction1 objectAtIndex:self.counter1];
    //end of initial Instruction:Text
    //=========================================================
    /*
     Initial Instruction:Sound  
     */
    
    [self performSelector:@selector(delay) withObject: nil afterDelay: 2.0];
    //end of  initial Instruction:Sound
    
    
    //========================================================   
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

//=========================================================
/*
 Reference to the Instruction
 */
-(void)delay{
    [self play:(CFStringRef)[self.tommySounds1 objectAtIndex:self.counter1]];
    [self locationappear:self.counter1];
    
    
}//end
//=========================================================


//=========================================================
/*
 Play Instruction,Display instruction and Change Tommy's view
 
 */
-(void)secondDelay{
    if(self.counter1<numberOfOptions11){
        [self play:(CFStringRef)[self.tommySounds1 objectAtIndex:self.counter1]];
        
        self.instructionDisplaySad.text=[self.instruction1 objectAtIndex:self.counter1];
        [self locationappear:self.counter1];
        
        self.tommySadNormal.image=[UIImage imageNamed:@"tommyNormal1.png"];
    }
    
}
//=========================================================

-(void)locationappear :(int) k{
    switch(k){
        case 0: {self.arrowa.alpha=1;
            
            break;
        }
            
        case 1:{ self.arrow1a.alpha=1;
            
            break;}
            
        case 2: {self.arrow2a.alpha=1;
            
            break;}
            
        case 3: {self.arrow3a.alpha=1;
            
            break;}
            
        case 4: {self.arrow4a.alpha=1;
            break;}
            
        case 5: {self.arrow5a.alpha=1;
            
            break;}
            
            
        case 6: {self.arrow6a.alpha=1;
            
            break;}
    }
}

-(void)locationdisappear :(int) k{
    switch(k){
        default: {self.arrow6a.alpha=0;
            
            break;
        }
            
        case 1:{ self.arrowa.alpha=0;
            
            break;}
            
        case 2: {self.arrow1a.alpha=0;
            
            break;}
            
        case 3: {self.arrow2a.alpha=0;
            
            break;}
            
        case 4: {self.arrow3a.alpha=0;
            break;}
            
        case 5: {self.arrow4a.alpha=0;
            
            break;}
            
            
        case 6: {self.arrow5a.alpha=0;
            
            break;}
    }
}







- (void)viewDidUnload
{
    [self setPresent1a:nil];
    [self setPresent2a:nil];
    [self setPresent3a:nil];
    [self setPresent4a:nil];
    [self setPresent5a:nil];
    [self setPresent6a:nil];
    [self setPresent7a:nil];
    [self setTarget1a:nil];
    [self setTarget2a:nil];
    [self setTarget6a:nil];
    [self setTarget7a:nil];
    [self setTarget4a:nil];
    [self setTarget5a:nil];
    [self setTarget3a:nil];
    [self setHintImage1a:nil];
    [self setTommySadNormal:nil];
    [self setInstructionDisplaySad:nil];
    [self setArrowa:nil];
    [self setArrow1a:nil];
    [self setArrow5a:nil];
    [self setArrow6a:nil];
    [self setArrow3a:nil];
    [self setArrow4a:nil];
    [self setArrow2a:nil];
    [super viewDidUnload];
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (IBAction)close:(UIButton *)sender {
    //exit(0);
}

- (IBAction)handledPan:(UIPanGestureRecognizer *)recognizer1a {
    // If pan began
    if (recognizer1a.state == UIGestureRecognizerStateBegan) {
        // Get the position where image was dragged
        self.selectedImageCenter = recognizer1a.view.center;
    }
    
    CGPoint translation = [recognizer1a translationInView:self.view];
    recognizer1a.view.center = CGPointMake(recognizer1a.view.center.x + translation.x,recognizer1a.view.center.y + translation.y);
    [recognizer1a setTranslation:CGPointMake(0, 0) inView:self.view];
    
    // Show hint rectangle
    UIView *matchView = [self getViewFromCorreponsingMatch:recognizer1a];
    CGPoint matchCenter = matchView.center;
    if([self isInCorrectPosition:recognizer1a.view.center:matchCenter]) {
        self.hintImage1a.center = matchCenter;
        self.hintImage1a.hidden = NO;
    } else {
        self.hintImage1a.hidden = YES;
    }
    
    // If pan ended
    if (recognizer1a.state == UIGestureRecognizerStateEnded) {
        [self handlePanEnded:recognizer1a];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

@end
