//
//  MerchantSearchView.h
//  TXSLiCai
//
//  Created by Owen on 16/8/3.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  处理搜索后的事件
 *
 *  @param string 传出参数
 */
typedef void(^Search)(NSString *string);
@interface MerchantSearchView : UIView
/**
 *  初始化
 *
 *  @param frame    搜索页面的frame
 *  @param parament  传入热搜参数
 *  @param search   搜索时间block
 *
 *  @return 返回SearchView
 */
- (instancetype)initSearchViewWithFrame:(CGRect)frame Parament:(id)parament search:(Search)search;
@end
