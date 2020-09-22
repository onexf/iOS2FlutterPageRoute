//
//  FlutterInstanceView.m
//  sellManage
//
//  Created by XGW on 2020/9/21.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import "FlutterInstanceView.h"
#import "UIViewController+Arguments.h"

@interface FlutterInstanceView () // <FlutterBinaryMessenger>

@end

@implementation FlutterInstanceView


//+ (FlutterInstanceView *)sharedView {
//    static FlutterInstanceView *sharedView = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedView = [[self alloc] init];
//    });
//    return sharedView;
//}


- (void)viewDidLoad {
  
    [super viewDidLoad];
    
//    self.fd_interactivePopDisabled = YES;
    
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"flutter2native_channel" binaryMessenger:self]; // 一百万个代理方法
    
    // 监听来自Flutter的消息
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"openNativePage"]) { // Flutter页面打开新的Native页面
            NSDictionary *flutterMessage = call.arguments;
            Class ViewController = NSClassFromString(flutterMessage[@"iosPageName"]);
            UIViewController *VC = [[ViewController alloc] init];
            VC.arguments = call.arguments;
//            NSLog(@"flutter端参数：%@", call.arguments);
            [self.navigationController pushViewController:VC animated:YES];
            result(@0);
        } else if ([call.method isEqualToString:@"closeFlutterPage"]) { // 关闭Flutter页面
            [self.navigationController popViewControllerAnimated:YES];
            result(@0);
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

/// bug，页面不会销毁，可能由于使用了setInitialRoute设置进入Flutter的根页面
- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
