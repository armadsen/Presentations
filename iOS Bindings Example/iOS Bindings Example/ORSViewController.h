//
//  ORSViewController.h
//  iOS Bindings Example
//
//  Created by Andrew Madsen on 10/1/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ORSPerson;

@interface ORSViewController : UIViewController


- (IBAction)nameEdited:(UITextField *)sender;
- (IBAction)ageFieldEdited:(UITextField *)sender;
- (IBAction)ageSliderMoved:(UISlider *)sender;

@property (nonatomic, strong) ORSPerson *person;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UISlider *ageSlider;

@end
