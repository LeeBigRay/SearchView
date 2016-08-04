//
//  MerchantSearchCollectionReusableView.m
//  TXSLiCai
//
//  Created by Owen on 16/8/1.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "MerchantSearchCollectionReusableView.h"
@interface MerchantSearchCollectionReusableView ()
@property (nonatomic, weak) UILabel *textLabel;
@property (nonatomic, weak) UIImageView *imageView;
@end
@implementation MerchantSearchCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (self.frame.size.height - 18 /2 ), 18, 18)];
//        [self addSubview:imageView];
//        self.imageView = imageView;
//        self.backgroundColor = [UIColor cyanColor];
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 22*kHeightRatio)];
        line.backgroundColor =UIColorFromRGB(0xf0eff5);
        [self addSubview:line];
        CGFloat aboutHeight = 50*kHeightRatio;
        UILabel *label = [self creatLabelWithFrame:CGRectMake(50*kHeightRatio, 60*kHeightRatio, 100, aboutHeight) Text:nil fontSize:50*kHeightRatio textColor:UIColorFromRGB(0x444444) textAlignment:0 backGrounColor: nil];//[UIColor orangeColor]
        [self addSubview:label];
        self.textLabel = label;
        
        UIButton *delectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        delectButton.frame = CGRectMake(self.frame.size.width - 220*kHeightRatio, 60*kHeightRatio, 200*kHeightRatio, aboutHeight);
        [delectButton setTitleColor:UIColorFromRGB(0x444444)  forState:UIControlStateNormal];
        [delectButton.titleLabel setTextAlignment:1];
        [delectButton setImage:[UIImage imageNamed:@"Merchant_search_trash"] forState:UIControlStateNormal];
        [delectButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [delectButton setTitle:@"清除" forState:UIControlStateNormal];
        [delectButton addTarget:self action:@selector(delect) forControlEvents:UIControlEventTouchUpInside];
        delectButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [self addSubview:delectButton];
        _delectButton = delectButton;
//        cancelButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
//        cancelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        cancelButton.imageEdgeInsets = UIEdgeInsetsMake(100 -60*kHeightRatio, 100 - 60*kHeightRatio, 0, 0);

    }
    return self;
}

- (UILabel *)creatLabelWithFrame:(CGRect)frame Text:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment backGrounColor:(UIColor *)backGrounColor
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    
    if (text != nil) {
        label.text = text;
    }
    if (fontSize !=0 ) {
        label.font = [UIFont systemFontOfSize:fontSize];
    }
    //label.font = MICROSOFT_YAHEI_FONT(label.font.pointSize);
    
    if (textColor != nil) {
        label.textColor = textColor;
    }
    if (textAlignment != 0) {
        label.textAlignment = textAlignment;
    }
    if (backGrounColor != nil) {
        label.backgroundColor = backGrounColor;
    }
    return label;
    
}
- (void)delect {
    if ([self.delectDelegate respondsToSelector:@selector(delectData:)]) {
        [self.delectDelegate delectData:self];
    }
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    return self;
}
- (void) setText:(NSString *)text {
    self.textLabel.text = text;
}
- (void) setImage:(NSString *)image {
    [self.imageView setImage:[UIImage imageNamed:image]];
}
@end
