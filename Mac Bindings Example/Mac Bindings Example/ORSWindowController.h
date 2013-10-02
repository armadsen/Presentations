//
//  ORSWindowController.h
//  Mac Bindings Example
//
//  Created by Andrew Madsen on 10/1/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ORSPerson;

@interface ORSWindowController : NSWindowController

+ (instancetype)windowController;

@property (nonatomic, strong) ORSPerson *person;

@end
