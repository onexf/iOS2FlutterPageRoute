//
//  FlutterArgumentsManager.h
//  sellManage
//
//  Created by XGW on 2020/9/21.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlutterArgumentsManager : NSObject


/// 传递参数管理
+ (FlutterArgumentsManager *)sharedManager;





+ (void)setDelegateWithEventChannel:(FlutterEventChannel *)eventChannel arguments:(NSDictionary *)arguments;



@end

NS_ASSUME_NONNULL_END
