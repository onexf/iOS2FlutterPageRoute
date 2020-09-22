//
//  FlutterInstanceView.h
//  sellManage
//
//  Created by XGW on 2020/9/21.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN


/// 与纯 Flutter 应用不同，原生应用混编 Flutter 由于涉及到原生页面与 Flutter 页面之间切换，因此导航栈内可能会出现多个 Flutter 容器的情况，即多个 Flutter 实例。Flutter 实例的初始化成本非常高昂，每启动一个 Flutter 实例，就会创建一套新的渲染机制，即 Flutter Engine，以及底层的 Isolate。而这些实例之间的内存是不互相共享的，会带来较大的系统资源消耗。
@interface FlutterInstanceView : FlutterViewController

//+ (FlutterInstanceView *)sharedView;





//- (instancetype)init NS_UNAVAILABLE;
//
//+ (instancetype)new NS_UNAVAILABLE;


@end

NS_ASSUME_NONNULL_END
