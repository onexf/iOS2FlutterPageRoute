//
//  UIViewController+Arguments.m
//  sellManage
//
//  Created by XGW on 2020/9/22.
//  Copyright © 2020 ichangtou. All rights reserved.
//

#import "UIViewController+Arguments.h"
#import <objc/runtime.h>

@interface UIViewController (Arguments)

@end


@implementation UIViewController (Arguments)

- (NSDictionary *)arguments {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setArguments:(NSDictionary *)arguments {
    objc_setAssociatedObject(self, @selector(arguments), arguments, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
