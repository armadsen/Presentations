//
//  PMLPasteImageView.m
//  SkiBumMenu
//
//  Created by Aaron London on 10/9/13.
//  Copyright (c) 2013 postmechanical, LLC. All rights reserved.
//

#import "PMLPasteImageView.h"

@implementation PMLPasteImageView

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:) || (self.image != nil && action == @selector(flip:)))
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
