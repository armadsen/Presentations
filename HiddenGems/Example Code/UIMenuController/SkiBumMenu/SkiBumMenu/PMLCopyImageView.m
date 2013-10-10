//
//  PMLCopyImageView.m
//  SkiBumMenu
//
//  Created by Aaron London on 10/9/13.
//  Copyright (c) 2013 postmechanical, LLC. All rights reserved.
//

#import "PMLCopyImageView.h"

@implementation PMLCopyImageView

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - UIResponderStandardEditActions

- (void)copy:(id)sender
{
    [[UIPasteboard generalPasteboard] setImage:self.image];
}

@end
