//
//  MerchantSearchView.h
//  TXSLiCai
//
//  Created by Owen on 16/8/3.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Search)(NSString *string);
@interface MerchantSearchView : UIView
- (instancetype)initSearchViewWithFrame:(CGRect)frame Parament:(id)parament search:(Search)search;
@end
