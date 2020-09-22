//
//  PushInAFlutterView.h
//  sellManage
//
//  Created by XGW on 2020/9/17.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PushInAFlutterView : NSObject


/// 跳转至FLutter页面
/// @param routePath 页面路径
/// @param arguments 传递参数
+ (void)pushInFlutterWithRoute:(NSString *)routePath eventChannelName:(nullable NSString *)eventChannelName arguments:(nullable NSDictionary *)arguments;


@end

NS_ASSUME_NONNULL_END
