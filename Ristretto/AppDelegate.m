//
//  AppDelegate.m
//  Ristretto
//
//  Created by Josh Puckett on 11/20/14.
//  Copyright (c) 2014 Josh Puckett. All rights reserved.
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    AVAudioPlayer *audioPlayer;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];

    NSImage *menuIcon       = [NSImage imageNamed:@"Status"];
    NSImage *highlightIcon  = [NSImage imageNamed:@"StatusHighlighted"];

    [[self statusItem] setImage:menuIcon];
    [[self statusItem] setAlternateImage:highlightIcon];
    [[self statusItem] setHighlightMode:YES];
    [[self statusItem] setTarget:self];
    [[self statusItem] setAction:@selector(coffeeshopChillTime:)];

    NSString* path = [[NSBundle mainBundle] pathForResource:@"murmur" ofType:@"mp3"];
    NSURL* file = [NSURL fileURLWithPath:path];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file error:nil];
    [audioPlayer prepareToPlay];
    audioPlayer.numberOfLoops = -1; //Infinite chilloop
}

- (void)coffeeshopChillTime:(id)sender {
    if ([audioPlayer isPlaying]) {
        [audioPlayer pause];
        NSLog(@"Pause the chill!");
    } else {
        [audioPlayer play];
        NSLog(@"Pour the chill!");
    }
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
