//
//  MerchantSearchCollCell.h
//  TXSLiCai
//
//  Created by Owen on 16/8/1.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MerchantSearchCollCell;
@protocol MerchantSearchCollCellDelegate <NSObject>

- (void)selectButtonClick:(MerchantSearchCollCell *)cell;

@end
@interface MerchantSearchCollCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *contentButton;
@property (nonatomic, weak) id<MerchantSearchCollCellDelegate>delegate;
+ (CGSize)getSizeWithText:(NSString *)text;
@end
