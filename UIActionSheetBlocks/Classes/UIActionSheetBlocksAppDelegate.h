//
//  UIActionSheetBlocksAppDelegate.h
//  UIActionSheetBlocks
//
//  Created by Landon Fuller on 7/4/09.
//  Copyright Plausible Labs Cooperative, Inc. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIActionSheetBlocksViewController;

@interface UIActionSheetBlocksAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIActionSheetBlocksViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIActionSheetBlocksViewController *viewController;

@end

