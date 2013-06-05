//
//  LettersViewController.h
//  Austy
//
//  Created by Andrew Proctor on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>

@interface LettersViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *match1;
@property (weak, nonatomic) IBOutlet UIImageView *match2;
@property (weak, nonatomic) IBOutlet UIImageView *option1;
@property (weak, nonatomic) IBOutlet UIImageView *option2;
@property (weak, nonatomic) IBOutlet UIImageView *option3;
@property (weak, nonatomic) IBOutlet UIImageView *option4;
@property (weak, nonatomic) IBOutlet UIImageView *option5;

@property (weak, nonatomic) IBOutlet UIView *hintImage;
- (void)play:(CFStringRef)resourceName;
- (void)randomizeImages;
- (void)randomizePositions;
- (void)performLastAnimations;
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizerl;

@end
