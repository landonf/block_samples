//
//  NSOperation+Blocks.m
//  NSOperationBlocks
//
//  Created by Landon Fuller on 7/4/09.
//  Copyright 2009 Plausible Labs Cooperative, Inc.. All rights reserved.
//

#import "NSOperationQueue+PLBlocks.h"

@interface PLBlockOperation : NSOperation {
@private
    void (^_block)();
}
+ (id) blockOperationWithBlock: (void (^)()) block;
- (id) initWithBlock: (void (^)()) block;
@end


/**
 * Add additional block support to NSOperationQueue. Category
 * methods use PL-prefixed methods to avoid naming
 * conflicts with future OS releases.
 */
@implementation NSOperationQueue (PLBlocks)

/**
 * Add a block-based operation to the queue.
 */
- (void) pl_addOperationWithBlock: (void (^)()) block {
    [self addOperation: [PLBlockOperation blockOperationWithBlock: block]];
}

@end


/**
 * Wraps a block as an NSOperation
 */

@implementation PLBlockOperation

/** Create a new operation with the provided block. */
+ (id) blockOperationWithBlock: (void (^)()) block {
    return [[[self alloc] initWithBlock: block] autorelease];
}

/** Initialize with the provided block. */
- (id) initWithBlock: (void (^)()) block {
    if ((self = [super init]) == nil)
        return nil;

    /* Blocks must be copied */
    _block = [block copy];

    return self;
}

// from NSOperation
- (void) main {
    _block();
}

- (void) dealloc {
    [_block release];
    [super dealloc];
}

@end