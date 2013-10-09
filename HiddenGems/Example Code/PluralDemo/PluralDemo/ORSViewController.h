//
//  ORSViewController.h
//  PluralDemo
//
//  Created by Andrew Madsen on 10/8/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORSViewController : UIViewController <UITextFieldDelegate>

- (IBAction)textFieldEditingDidEnd:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
