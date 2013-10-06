//
//  ORSAppDelegate.h
//  Mac Core Data Bindings Example
//
//  Created by Andrew Madsen on 10/1/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ORSDatabase;

@interface ORSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) ORSDatabase *database;

@end
