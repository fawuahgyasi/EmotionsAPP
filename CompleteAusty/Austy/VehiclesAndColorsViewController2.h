//
//  VehiclesAndColorsViewController2.h
//  Austy
//
//  Created by Jose Picado on 3/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AudioToolbox/AudioToolbox.h>

@interface VehiclesAndColorsViewController2 : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *match1;
@property (weak, nonatomic) IBOutlet UIImageView *match2;
@property (weak, nonatomic) IBOutlet UIImageView *match3;
@property (weak, nonatomic) IBOutlet UIImageView *option1;
@property (weak, nonatomic) IBOutlet UIImageView *option2;
@property (weak, nonatomic) IBOutlet UIImageView *option3;
@property (weak, nonatomic) IBOutlet UIImageView *hintImage;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;
@end
