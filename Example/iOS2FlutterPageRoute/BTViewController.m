//
//  BTViewController.m
//  iOS2FlutterPageRoute
//
//  Created by onexf on 09/22/2020.
//  Copyright (c) 2020 onexf. All rights reserved.
//

#import "BTViewController.h"
#import "iOS2FlutterPageRoute.h"

@interface BTViewController ()

@end

@implementation BTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)pushFlutterView:(UIButton *)sender {
    [PushInAFlutterView pushInFlutterWithRoute:@"/saleorder" eventChannelName:@"sold_list" arguments:@{
        @"token": @"传递的数据呀"
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
