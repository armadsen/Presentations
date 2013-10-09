//
//  ORSViewController.m
//  PluralDemo
//
//  Created by Andrew Madsen on 10/8/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import "ORSViewController.h"

@interface ORSViewController ()

@end

@implementation ORSViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)textFieldEditingDidEnd:(UITextField *)sender
{
    NSInteger numPeople = [sender.text integerValue];
    self.textView.text = [NSString localizedStringWithFormat:
                          NSLocalizedString(@"%d people are in the room", @"%d people are in the room"), (long)numPeople];
}

@end
