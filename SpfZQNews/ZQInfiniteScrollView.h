//
//  ZQInfiniteScrollView.h
//  WHU Mobile
//
//  Created by 黄 嘉恒 on 7/19/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

@import UIKit;
@class ZQInfiniteScrollView;

@protocol ZQInfiniteScrollViewDelegate <UIScrollViewDelegate>

@optional
- (void)infiniteScrollViewDidRecenter:(ZQInfiniteScrollView *)infiniteScrollView;

@end

@interface ZQInfiniteScrollView : UIScrollView

@property (strong, readonly, nonatomic) UIView *leftView;
@property (strong, readonly, nonatomic) UIView *middleView;
@property (strong, readonly, nonatomic) UIView *rightView;
@property (weak, nonatomic) id<ZQInfiniteScrollViewDelegate> delegate;
- (void)scrollToLeft;
- (void)scrollToRight;

@end
