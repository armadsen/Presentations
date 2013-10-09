//
//  PMLViewController.m
//  Ski Bum
//
//  Created by Aaron London on 10/8/13.
//  Copyright (c) 2013 postmechanical, LLC. All rights reserved.
//

#import "PMLViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface PMLViewController ()

@property(nonatomic,strong) AVSpeechSynthesizer *synthesizer;
@property(nonatomic,strong) NSArray *wordsOfWisdom;

@end

@implementation PMLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.wordsOfWisdom = @[
                           @"Sweet powder dude!",
                           @"Free your heels and your mind will follow.",
                           @"Steep and deep.",
                           @"Watch out for the mank.",
                           @"Time to get after it!",
                           @"Big air!",
                           @"Blower pow!"
                           ];
}

- (IBAction)speakDude:(id)sender {
    if (self.synthesizer.isSpeaking)
    {
        [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
    NSString *string = self.wordsOfWisdom[(rand() * 10) % (self.wordsOfWisdom.count - 1)];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string];
    utterance.rate = AVSpeechUtteranceMinimumSpeechRate;
    [self.synthesizer speakUtterance:utterance];
}

@end
