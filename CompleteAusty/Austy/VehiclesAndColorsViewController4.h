//
//  VehiclesAndColorsViewController4.h
//  Austy
//
//  Created by Jose Picado on 4/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>

@interface VehiclesAndColorsViewController4 : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *match1;
@property (weak, nonatomic) IBOutlet UIImageView *match2;
@property (weak, nonatomic) IBOutlet UIImageView *match3;
@property (weak, nonatomic) IBOutlet UIImageView *option1;
@property (weak, nonatomic) IBOutlet UIImageView *option2;
@property (weak, nonatomic) IBOutlet UIImageView *option3;
@property (weak, nonatomic) IBOutlet UIImageView *hintImage;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
@end
