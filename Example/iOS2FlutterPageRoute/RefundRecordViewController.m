//
//  CTRefundRecordViewController.m
//  iOS2FlutterPageRoute_Example
//
//  Created by XGW on 2020/9/22.
//  Copyright © 2020 onexf. All rights reserved.
//

#import "RefundRecordViewController.h"
#import "iOS2FlutterPageRoute.h"


@interface RefundRecordViewController ()

@end

@implementation RefundRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FlutterPush的原生页面";
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    if (self.arguments) {
        NSString *info = self.arguments[@"result"];
        
        [self.view addSubview:({
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 300, 40)];
            label.text = info;
            label;
        })];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
