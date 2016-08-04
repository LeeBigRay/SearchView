//
//  MerchantSearchView.m
//  TXSLiCai
//
//  Created by Owen on 16/8/3.
//  Copyright © 2016年 Arvin. All rights reserved.
//

#import "MerchantSearchView.h"
#import "MerchantSearchCollCell.h"
#import "MerchantSearchCollectionReusableView.h"
#import "MerchantSearchCollLayout.h"
#import "MerchantSearchTextFieldView.h"

static NSString *const collectionViewCell = @"cell";
static NSString *const headerViewInden = @"headView";

@interface MerchantSearchView()<UICollectionViewDelegate,UICollectionViewDataSource,MerchantSearchCollCellDelegate,MerchantSearchCollectionReusableViewDelegate,UIScrollViewDelegate,UITextFieldDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)NSMutableArray *modelArray;//存储数组
@property (nonatomic, strong)NSMutableArray *searchArray;//搜索历史
@property (nonatomic, strong) UICollectionView *MyCollectionVeiw;
@property (nonatomic, strong) MerchantSearchTextFieldView *searchTextFieldView;
@property (nonatomic, copy) Search search;
@end
@implementation MerchantSearchView
#pragma mark - life cycle

- (instancetype)initSearchViewWithFrame:(CGRect)frame Parament:(id)parament search:(Search)search {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =UIColorFromRGB(0xf0eff5);
        [self prepareDataWithParament:parament];
        self.search = search;
        [self addSubview:self.searchTextFieldView];
        [self addSubview:self.MyCollectionVeiw];
        
    }
    return self;
}


#pragma mark - 布局

#pragma mark - 赋值页面

#pragma mark - event response
- (void)buttonAction:(UIButton *)btn {
    
}

#pragma mark --点击空白回收键盘--
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resignFirstResponderView:self];
}

- (void)resignFirstResponderView:(UIView *)view {
    NSArray *tempArray = view.subviews;
    if (tempArray.count <1) {
        return;
    } else {
        for (UIView *aView in tempArray) {
            if ([aView isKindOfClass:[UITextField class]]) {
                UITextField *textField = (UITextField*)aView;
                
                [textField resignFirstResponder];
            } else if([aView isKindOfClass:[UITextView class]]) {
                UITextView *textView = (UITextView *)aView;
                
                [textView resignFirstResponder];
            } else {
                [self resignFirstResponderView:aView];
                
            }
        }
    }
}
#pragma mark - UICollectionViewdelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *tempArray = [self.modelArray[section] objectForKey:@"section_content"];
    return tempArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MerchantSearchCollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCell forIndexPath:indexPath];
    NSDictionary *modelDic = self.modelArray[indexPath.section];
    NSArray *contenArray = modelDic[@"section_content"];
    [cell.contentButton setTitle:contenArray[indexPath.row] forState:UIControlStateNormal];
    cell.delegate = self;
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    if (self.searchArray.count == 0) {
        return 1;
    }
    return self.modelArray.count;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MerchantSearchCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerViewInden forIndexPath:indexPath ];
        view.delectDelegate = self;
        NSDictionary *contenDic = self.modelArray[indexPath.section];
        [view setText:contenDic[@"section_title"]];
        if (indexPath.section == 0) {
            [view setImage:@""];
            view.delectButton.hidden = YES;
        }else {
            [view setImage:@""];
            view.delectButton.hidden = NO;
        }
        reusableView = view;
    }else {
        
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"foot" forIndexPath:indexPath ];
        reusableView = view;
    }
    return reusableView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *contenDic = self.modelArray[indexPath.section];
    NSArray *contenArray = contenDic[@"section_content"];
    if (contenArray.count > 0) {
        return [MerchantSearchCollCell getSizeWithText:contenArray[indexPath.row]];
        
    }
    return CGSizeMake(80, 24);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 120*kHeightRatio);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, 30*kHeightRatio);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 20, 0, 20);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma mark - celldelegate
- (void)selectButtonClick:(MerchantSearchCollCell *)cell {
    NSIndexPath *indexPath = [self.MyCollectionVeiw indexPathForCell:cell];
    NSDictionary *contenDic = self.modelArray[indexPath.section];
    NSArray *contenArray = contenDic[@"section_content"];
     self.searchTextFieldView.searchTextField.text =contenArray[indexPath.row];
    if (self.search) {
        self.search(@"123");
    }
#warning mark -添加点击跳转
    NSLog(@"%@",contenArray[indexPath.row]);
}
#pragma mark - headViewdelegate
- (void)delectData:(MerchantSearchCollectionReusableView *)view {
    if(self.searchArray.count>0) {
        [self.searchArray removeAllObjects];
        [[NSUserDefaults standardUserDefaults]setObject:nil forKey:MerchantSearch];
        [self.MyCollectionVeiw reloadData];
    }
}
#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.searchTextFieldView.searchTextField resignFirstResponder];
}
#pragma mark - texteFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if ([[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {
        
        return NO;
    }
    if ([self.searchArray containsObject:textField.text]) {
        return YES;
    }
    [self.searchArray addObject:textField.text];
    [self.MyCollectionVeiw reloadData];
    [[NSUserDefaults standardUserDefaults]setObject:self.searchArray forKey:MerchantSearch];
#warning mark - 添加搜索跳转
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([[textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]) {//如果没有文字处理
        
    }
    return YES;
}
#pragma mark - 数据请求

#pragma mark - 数据解析
- (void)prepareDataWithParament:(id)parament {
    NSDictionary *testDict = @{@"section_id":@"1",@"section_title":@"热门搜索",@"section_content":@[@"化妆化妆棉",@"面膜",@"口红红红红红红红红红红红红红红红红",@"眼霜",@"洗面奶",@"防晒霜",@"补水",@"香水",@"眉笔"]};
    [self.modelArray addObject:testDict];
    NSMutableDictionary *historyDic = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"1",@"section_id",@"历史搜索",@"section_title", nil];
    NSArray *historyArray = [[NSUserDefaults standardUserDefaults] objectForKey:MerchantSearch];
    [self.searchArray addObjectsFromArray:historyArray];
    [historyDic setObject:self.searchArray forKey:@"section_content"];
    [self.modelArray addObject:historyDic];
}
#pragma mark - set get
- (NSMutableArray *)modelArray {
    if (_modelArray == nil) {
        _modelArray = [NSMutableArray array];
        
    }
    return _modelArray;
}
- (NSMutableArray *)searchArray {
    if (_searchArray == nil) {
        _searchArray = [NSMutableArray array];
    }
    return _searchArray;
}
- (UICollectionView *)MyCollectionVeiw {
    if (_MyCollectionVeiw == nil) {
        _MyCollectionVeiw = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200*kHeightRatio, kScreenWidth, kScreenHeight - 60) collectionViewLayout:[MerchantSearchCollLayout new]];
        [_MyCollectionVeiw registerClass:[MerchantSearchCollCell class] forCellWithReuseIdentifier:collectionViewCell];
        [_MyCollectionVeiw registerClass:[MerchantSearchCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerViewInden];
        [_MyCollectionVeiw registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
        _MyCollectionVeiw.delegate = self;
        _MyCollectionVeiw.dataSource = self;
        _MyCollectionVeiw.backgroundColor =UIColorFromRGB(0xf7f7f7) ;
        _MyCollectionVeiw.alwaysBounceVertical = YES;
    }
    return _MyCollectionVeiw;
}

- (MerchantSearchTextFieldView *)searchTextFieldView {
    if (_searchTextFieldView == nil) {
        _searchTextFieldView = [[MerchantSearchTextFieldView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200*kHeightRatio)];
        _searchTextFieldView.searchTextField.delegate =self;
        [_searchTextFieldView.cancelButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _searchTextFieldView;
}

@end
