//
//  PMLViewController.m
//  SkiBumMenu
//
//  Created by Aaron London on 10/9/13.
//  Copyright (c) 2013 postmechanical, LLC. All rights reserved.
//

#import "PMLViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PMLPasteImageView.h"

@interface PMLViewController ()

@property(nonatomic,strong) UIView *currentView;

@end

@implementation PMLViewController

- (IBAction)tap:(UITapGestureRecognizer*)recognizer
{
    if (self.currentView != recognizer.view)
    {
        self.currentView.layer.borderColor = NULL;
        self.currentView.layer.borderWidth = 0.0f;
        [self.currentView resignFirstResponder];
    }

    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        self.currentView = recognizer.view;
        [self.currentView becomeFirstResponder];
        self.currentView.layer.borderColor = [UIColor blueColor].CGColor;
        self.currentView.layer.borderWidth = 4.0f;
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        if ([self.currentView isKindOfClass:[PMLPasteImageView class]])
        {
            menuController.menuItems = @[[[UIMenuItem alloc] initWithTitle:@"Flip" action:@selector(flip:)]];
        }
        else
        {
            menuController.menuItems = nil;
        }
        [menuController setTargetRect:self.currentView.frame inView:self.currentView.superview];
        [menuController setMenuVisible:YES animated:NO];
    }
}

@end
