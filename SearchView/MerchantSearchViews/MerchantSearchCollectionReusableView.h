//
//  MerchantSearchCollectionReusableView.h
//  TXSLiCai
//
//  Created by Owen on 16/8/1.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MerchantSearchCollectionReusableView;
@protocol MerchantSearchCollectionReusableViewDelegate <NSObject>

- (void)delectData:(MerchantSearchCollectionReusableView *)view;

@end
@interface MerchantSearchCollectionReusableView : UICollectionReusableView
@property (nonatomic, weak) UIButton *delectButton;
@property (nonatomic, weak) id<MerchantSearchCollectionReusableViewDelegate> delectDelegate;
- (void) setText:(NSString *)text;
- (void) setImage:(NSString *)image;
@end
