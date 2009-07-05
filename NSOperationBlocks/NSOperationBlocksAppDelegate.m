//
//  NSOperationBlocksAppDelegate.m
//  NSOperationBlocks
//
//  Created by Landon Fuller on 7/4/09.
//  Copyright 2009 Plausible Labs Cooperative, Inc.. All rights reserved.
//

#import "NSOperationBlocksAppDelegate.h"

#import "NSOperationQueue+PLBlocks.h"
#import "NSThread+PLBlocks.h"

@implementation NSOperationBlocksAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSOperationQueue *q = [[NSOperationQueue alloc] init]; // This leaks -- it's here for succinctness.

    /* Data to process */
    NSData *data = [@"Hello, I'm a Block!" dataUsingEncoding: NSUTF8StringEncoding];

    /* Push an expensive computation to the operation queue, and then
     * display the response to the user on the main thread. */
    [q pl_addOperationWithBlock: ^{
        /* Perform expensive processing with data on our background thread */
        NSString *string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        
        /* This is the "expensive" part =) */
        sleep(5);
        
        /* Inform the user of the result on the main thread, where it's safe to play with the UI. */
        [[NSThread mainThread] pl_performBlock: ^{
            NSAlert *alert = [[[NSAlert alloc] init] autorelease];
            
            [alert addButtonWithTitle: @"OK"];
            [alert setMessageText: [NSString stringWithFormat: @"Processing completed: %@", string]];
            [alert runModal];
        }];

        /* We don't need to hold a string reference anymore */
        [string release];
    }];
}

@end
