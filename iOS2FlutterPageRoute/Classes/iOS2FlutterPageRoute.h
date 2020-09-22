//
//  Header.h
//  Pods
//
//  Created by XGW on 2020/9/22.
//


#import <Foundation/Foundation.h>


#ifndef _iOS2FLUTTERPAGEROUTE_
    #define _iOS2FLUTTERPAGEROUTE_

#if __has_include(<iOS2FlutterPageRoute/iOS2FlutterPageRoute.h>)


    FOUNDATION_EXPORT double iOS2FlutterPageRouteVersionNumber;
    FOUNDATION_EXPORT const unsigned char iOS2FlutterPageRouteVersionString[];

    #import <iOS2FlutterPageRoute/PushInAFlutterView.h>
    #import <iOS2FlutterPageRoute/UIViewController+Arguments.h>


#else

    #import "PushInAFlutterView.h"
    #import "UIViewController+Arguments.h"


#endif /* __has_include */

#endif /* _iOS2FLUTTERPAGEROUTE_ */
