//
//  UIActionSheetBlocksAppDelegate.m
//  UIActionSheetBlocks
//
//  Created by Landon Fuller on 7/4/09.
//  Copyright Plausible Labs Cooperative, Inc. 2009. All rights reserved.
//

#import "UIActionSheetBlocksAppDelegate.h"
#import "UIActionSheetBlocksViewController.h"

#import "PLActionSheet.h"

@implementation UIActionSheetBlocksAppDelegate

@synthesize window;
@synthesize viewController;

- (void) displaySheet {
    PLActionSheet *sheet = [[PLActionSheet alloc] initWithTitle: @"Destination"];
    
    /* A re-usable block that simply displays an alert message and then re-displays
     * the sheet */
    void (^alert)(NSString *) = ^(NSString *message) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Destination Selected"
                                                        message: message
                                                       delegate: nil
                                              cancelButtonTitle: @"OK"
                                              otherButtonTitles: nil];
        
        [alert show];
        [alert release];
    };
    
    [sheet addButtonWithTitle: @"Work" block: ^{
        alert(@"Work selected");
    }];
    
    [sheet addButtonWithTitle: @"Home" block: ^{
        alert(@"Home selected");
    }];
    
    [sheet addButtonWithTitle: @"School" block: ^{
        alert(@"School selected");
    }];
    
    [sheet setCancelButtonWithTitle: @"Cancel" block: ^{}];

    [sheet showInView: self.window];
    [sheet release];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
    [self displaySheet];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
