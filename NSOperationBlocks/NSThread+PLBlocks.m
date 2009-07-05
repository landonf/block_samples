//
//  NSRunLoop+PLBlocks.m
//  NSOperationBlocks
//
//  Created by Landon Fuller on 7/4/09.
//  Copyright 2009 Plausible Labs Cooperative, Inc.. All rights reserved.
//

#import "NSThread+PLBlocks.h"

/**
 * Add additional block support to NSRunLoop. Category
 * methods use PL-prefixed methods to avoid naming
 * conflicts with future OS releases.
 */
@implementation NSThread (PLBlocks)

/**
 * @internal
 * Performs actual block execution on the target runloop.
 */
- (void) _plblock_execute: (void (^)()) block {
    block();
}

/**
 * Schedule a block for execution on this thread.
 * @param block Block to execute
 */
- (void) pl_performBlock: (void (^)()) block {
    [self pl_performBlock: block waitUntilDone: NO];
}

/**
 * Schedule a block for execution on this thread.
 *
 * @param block Block to execute
 * @param wait If YES, wait until the block has executed prior to returning.
 */
- (void) pl_performBlock: (void (^)()) block waitUntilDone: (BOOL) wait {
    [self performSelector: @selector(_plblock_execute:)
                 onThread: self
               withObject: [[block copy] autorelease]
            waitUntilDone: wait];
}

@end
