//
//  FlutterArgumentsManager.m
//  sellManage
//
//  Created by XGW on 2020/9/21.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import "FlutterArgumentsManager.h"



@interface FlutterArgumentsManager ()<FlutterStreamHandler>

@property (nonatomic, copy) FlutterEventSink eventSink;


@property (nonatomic, strong) NSDictionary *arguments;

@end

/// <#Description#>
@implementation FlutterArgumentsManager

+ (FlutterArgumentsManager *)sharedManager {
    static FlutterArgumentsManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FlutterArgumentsManager alloc] init];
    });
    return sharedInstance;
}


+ (void)setDelegateWithEventChannel:(FlutterEventChannel *)eventChannel arguments:(NSDictionary *)arguments {
    [eventChannel setStreamHandler:FlutterArgumentsManager.sharedManager];
    FlutterArgumentsManager.sharedManager.arguments = arguments;
}


/// Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
/// @param arguments <#arguments description#>
/// @param events <#events description#>
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {

    self.eventSink = events;
    
    if (self.eventSink && self.arguments) {
        self.eventSink(self.arguments);
    }
    
    return nil;
}

- (FlutterError *)onCancelWithArguments:(id)arguments {
    self.eventSink = nil;
    return nil;
}


@end
