//
//  ORSAppDelegate.h
//  PluralDemoMac
//
//  Created by Andrew Madsen on 10/8/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ORSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (nonatomic, copy) NSNumber *numPeople;

@end
