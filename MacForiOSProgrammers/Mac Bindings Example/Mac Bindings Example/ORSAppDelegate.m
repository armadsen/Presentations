//
//  ORSAppDelegate.m
//  Mac Bindings Example
//
//  Created by Andrew Madsen on 10/1/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import "ORSAppDelegate.h"
#import "ORSWindowController.h"

@interface ORSAppDelegate ()

@property (nonatomic, strong) ORSWindowController *mainWindowController;

@end

@implementation ORSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.mainWindowController = [ORSWindowController windowController];
	[self.mainWindowController showWindow:self];
}

@end
