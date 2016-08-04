//
//  MerchantSearchTextFieldView.m
//  TXSLiCai
//
//  Created by Owen on 16/8/1.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "MerchantSearchTextFieldView.h"
@implementation MerchantSearchTextFieldView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =UIColorFromRGB(0xf7f7f7) ;
        self.searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(50*kHeightRatio, 90*kHeightRatio, 1018*kHeightRatio , 90*kHeightRatio)];
        self.searchTextField.backgroundColor =UIColorFromRGB(0xe8e8e8) ;
        self.searchTextField.clearButtonMode = UITextFieldViewModeAlways;
        self.searchTextField.returnKeyType = UIReturnKeySearch;
        [self.searchTextField.layer setCornerRadius:5];
        [self.searchTextField setFont:[UIFont systemFontOfSize:36*kHeightRatio]];
        
        UIImageView *textFieldImagView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 83*kHeightRatio, 42*kHeightRatio)];
        textFieldImagView.image = [UIImage imageNamed:@"Merchant_search_mirror"];
        self.searchTextField.leftView = textFieldImagView;
        self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
        self.searchTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        [self addSubview:_searchTextField];
        
        self.cancelButton =[UIButton buttonWithType:UIButtonTypeSystem];
        self.cancelButton.frame = CGRectMake(self.frame.size.width - 180*kHeightRatio, 90*kHeightRatio , 178*kHeightRatio, 90*kHeightRatio);
        [self.cancelButton setTintColor:[UIColor orangeColor]];
        [self.cancelButton.titleLabel setFont:[UIFont systemFontOfSize:40*kHeightRatio]];
        [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];

        
        [self addSubview:_cancelButton];
    }
    return self;
}

@end
