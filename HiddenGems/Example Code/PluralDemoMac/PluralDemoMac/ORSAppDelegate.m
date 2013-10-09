//
//  ORSAppDelegate.m
//  PluralDemoMac
//
//  Created by Andrew Madsen on 10/8/13.
//  Copyright (c) 2013 Open Reel Software. All rights reserved.
//

#import "ORSAppDelegate.h"

@implementation ORSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)setNumPeople:(NSNumber *)numPeople
{
    if (numPeople != _numPeople) {
        _numPeople = numPeople;
        
        NSString *string = [NSString localizedStringWithFormat:
                              NSLocalizedString(@"%d people are in the room", @"number of people in the room label"), (long)[numPeople integerValue]];
        NSLog(@"string: %@", string);
        
        NSString *lString = [[NSBundle mainBundle] localizedStringForKey:@"%d people are in the room" value:@"crap" table:nil];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"stringsdict"];
    }
}

@end
