//
//  ORSViewController.m
//  iOS Bindings Example
//
//  Created by Andrew Madsen on 10/1/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import "ORSViewController.h"
#import "ORSPerson.h"

@interface ORSViewController () <UITextFieldDelegate>

@end

@implementation ORSViewController

- (void)viewDidLoad
{
	ORSPerson *person = [[ORSPerson alloc] init];
	person.name = @"Johnny Appleseed";
	person.age = @25;
	[self setPerson:person];
}

- (void)dealloc
{
    [self setPerson:nil]; // Break KVO
}

#pragma mark - Actions

- (IBAction)nameEdited:(UITextField *)sender
{
	self.person.name = sender.text;
}

- (IBAction)ageFieldEdited:(UITextField *)sender
{
	self.person.age = @([sender.text integerValue]);
}

- (IBAction)ageSliderMoved:(UISlider *)sender
{
	self.person.age = @((NSUInteger)sender.value);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	if (object == self.person) {
		if ([keyPath isEqualToString:@"name"]) {
			self.nameField.text = self.person.name;
		}
		if ([keyPath isEqualToString:@"age"]) {
			self.ageField.text = [self.person.age stringValue];
			self.ageSlider.value = [self.person.age floatValue];
		}
	}
}

#pragma mark - Properties

- (void)setPerson:(ORSPerson *)person
{
	if (person != _person) {
		[_person removeObserver:self forKeyPath:@"name"];
		[_person removeObserver:self forKeyPath:@"age"];
		_person = person;
		[_person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionInitial context:NULL];
		[_person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionInitial context:NULL];
	}
}

@end
