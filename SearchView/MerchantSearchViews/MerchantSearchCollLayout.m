//
//  MerchantSearchCollLayout.m
//  TXSLiCai
//
//  Created by Owen on 16/8/1.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "MerchantSearchCollLayout.h"

@implementation MerchantSearchCollLayout
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    self.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.minimumInteritemSpacing = 10;
    self.minimumLineSpacing = 10;
    
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for (int i = 1 ; i < [attributes count]; ++i) {
        // 当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        // 上一个atttibutes;
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        if (prevLayoutAttributes.indexPath.section == currentLayoutAttributes.indexPath.section) {
            // 我们想设置的最大间距,可根据需求更改
            NSInteger maximumSpacing = 10;
            // 前一个cell的最右边
            NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
            // 如果当前一个cell的最右边加上我们想要的间距加上cell的宽度依然在contenSize,我们改变当前的cell的原点位置;
            // 不加这个判断的后果是,UICollectionView只显示一行,原因是下面所有cell的x值都被加到第一行最后一个元素的后面
            if ((origin + maximumSpacing +currentLayoutAttributes.frame.size.width ) <self.collectionViewContentSize.width - 40) {
                CGRect frame = currentLayoutAttributes.frame;
                frame.origin.x = origin + maximumSpacing;
                currentLayoutAttributes.frame = frame;
            }else {
//                CGRect frame = currentLayoutAttributes.frame;
//                frame.origin.x = maximumSpacing;
//                frame.origin.y = heightOrigin + maximumSpacing;
//                currentLayoutAttributes.frame = frame;
            }
        }
    }
    return attributes;

}
@end
