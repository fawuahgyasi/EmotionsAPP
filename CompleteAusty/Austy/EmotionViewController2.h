//
//  EmotionViewController2.h
//  Austy
//
//  Created by Fredrick Awuah-Gyasi on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>

@interface EmotionViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *present1;
@property (weak, nonatomic) IBOutlet UIImageView *present2;
@property (weak, nonatomic) IBOutlet UIImageView *present3;
@property (weak, nonatomic) IBOutlet UIImageView *present4;
@property (weak, nonatomic) IBOutlet UIImageView *present5;
@property (weak, nonatomic) IBOutlet UIImageView *present6;
@property (weak, nonatomic) IBOutlet UIImageView *present7;
@property (weak, nonatomic) IBOutlet UIImageView *target1;
@property (weak, nonatomic) IBOutlet UIImageView *target2;
@property (weak, nonatomic) IBOutlet UIImageView *target6;
@property (weak, nonatomic) IBOutlet UIImageView *target7;
@property (weak, nonatomic) IBOutlet UIImageView *target4;
@property (weak, nonatomic) IBOutlet UIImageView *target5;
@property (weak, nonatomic) IBOutlet UIImageView *target3;
@property (weak, nonatomic) IBOutlet UIImageView *hintImage1;
@property (weak, nonatomic) IBOutlet UIImageView *tommyHappyNormal;
@property (weak, nonatomic) IBOutlet UILabel *instructionDisplay;
@property (copy, nonatomic) NSArray *instruction;
@property (copy, nonatomic) NSArray *tommySounds;
@property (copy,nonatomic) NSArray *locationIndicators;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (weak, nonatomic) IBOutlet UIImageView *arrow1;
@property (weak, nonatomic) IBOutlet UIImageView *arrow5;
@property (weak, nonatomic) IBOutlet UIImageView *arrow6;
@property (weak, nonatomic) IBOutlet UIImageView *arrow3;
@property (weak, nonatomic) IBOutlet UIImageView *arrow4;
@property (weak, nonatomic) IBOutlet UIImageView *arrow2;
@property(weak,nonatomic) UIImageView * mine;
- (IBAction)close:(UIButton *)sender;

- (IBAction)handledPan:(UIPanGestureRecognizer *)recognizer1;

@end
