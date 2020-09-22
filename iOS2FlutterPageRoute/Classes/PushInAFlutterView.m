//
//  PushInAFlutterView.m
//  sellManage
//
//  Created by XGW on 2020/9/17.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import "PushInAFlutterView.h"

#import "FlutterArgumentsManager.h"

#import "FlutterInstanceView.h"


@interface PushInAFlutterView ()

@end


@implementation PushInAFlutterView


+ (void)pushInFlutterWithRoute:(NSString *)routePath eventChannelName:(nullable NSString *)eventChannelName arguments:(nullable NSDictionary *)arguments {
    
    FlutterInstanceView *flutterView = [[FlutterInstanceView alloc] init];
    
    [flutterView setInitialRoute:routePath];
    
    // 带参数给Flutter
    if (eventChannelName != nil && eventChannelName.length > 0) {
        FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:eventChannelName binaryMessenger:flutterView];
        [FlutterArgumentsManager setDelegateWithEventChannel:eventChannel arguments:arguments];
    }
    
    [[self getCurrentViewController].navigationController pushViewController:flutterView animated:YES];
    
}



+ (UIViewController *)getCurrentViewController {
    UIViewController* currentViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            
            currentViewController = currentViewController.presentedViewController;
        } else if ([currentViewController isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
            
        } else if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
        } else {
            
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                
                currentViewController = currentViewController.childViewControllers.lastObject;
                
                return currentViewController;
            } else {
                
                return currentViewController;
            }
        }
        
    }
    return currentViewController;
}

@end
