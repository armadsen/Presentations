//
//  ORSWindowController.m
//  Mac Bindings Example
//
//  Created by Andrew Madsen on 10/1/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import "ORSWindowController.h"
#import "ORSPerson.h"

@interface ORSWindowController ()

@end

@implementation ORSWindowController

+ (instancetype)windowController;
{
	return [[self alloc] initWithWindowNibName:@"ORSWindowController"];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
	ORSPerson *person = [[ORSPerson alloc] init];
	person.name = @"Johnny Appleseed";
	person.age = @25;
	[self setPerson:person];
}

@end
