//
//  NSOperation+Blocks.h
//  NSOperationBlocks
//
//  Created by Landon Fuller on 7/4/09.
//  Copyright 2009 Plausible Labs Cooperative, Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSOperationQueue (PLBlocks)
- (void) pl_addOperationWithBlock: (void (^)()) block;
@end
