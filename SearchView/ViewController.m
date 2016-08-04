//
//  ViewController.m
//  SearchView
//
//  Created by Owen on 16/8/4.
//  Copyright © 2016年 Owen.kang. All rights reserved.
//

#import "ViewController.h"
#import "MerchantSearchView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MerchantSearchView * merView = [[MerchantSearchView alloc] initSearchViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) Parament:nil search:^(NSString *string) {
        
    }];
    [self.view addSubview:merView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
