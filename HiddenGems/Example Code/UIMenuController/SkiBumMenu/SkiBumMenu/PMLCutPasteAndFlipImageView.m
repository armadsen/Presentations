//
//  PMLPasteImageView.m
//  SkiBumMenu
//
//  Created by Aaron London on 10/9/13.
//  Copyright (c) 2013 postmechanical, LLC. All rights reserved.
//

#import "PMLCutPasteAndFlipImageView.h"

@implementation PMLCutPasteAndFlipImageView

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
    {
        return YES;
    }
    else if (self.image != nil && (action == @selector(cut:) || action == @selector(flip:)))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - UIResponderStandardEditActions

- (void)paste:(id)sender
{
    self.image = [UIPasteboard generalPasteboard].image;
}

- (void)cut:(id)sender
{
    [UIPasteboard generalPasteboard].image = self.image;
    self.image = nil;
}

#pragma mark - Customn actions

- (void)flip:(id)sender
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         if (CGAffineTransformIsIdentity(self.transform))
                         {
                             self.transform = CGAffineTransformMakeRotation(M_PI);
                         }
                         else
                         {
                             self.transform = CGAffineTransformIdentity;
                         }
                     }];
}

@end
