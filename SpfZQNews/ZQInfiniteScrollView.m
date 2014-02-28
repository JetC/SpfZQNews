//
//  ZQInfiniteScrollView.m
//  WHU Mobile
//
//  Created by 黄 嘉恒 on 7/19/13.
//  Copyright (c) 2013 黄 嘉恒. All rights reserved.
//

#import "ZQInfiniteScrollView.h"

@interface ZQInfiniteScrollView ()

@property (strong, readwrite, nonatomic) UIView *leftView;
@property (strong, readwrite, nonatomic) UIView *middleView;
@property (strong, readwrite, nonatomic) UIView *rightView;

@end

@implementation ZQInfiniteScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInfiniteScrollView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupInfiniteScrollView];
    }
    return self;
}

- (void)setupInfiniteScrollView
{
    self.pagingEnabled = YES;
    self.bounces = NO;
    self.scrollsToTop = NO;
    // hide horizontal scroll indicator so our recentering trick is not revealed
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    
    self.contentSize = CGSizeMake(CGRectGetWidth(self.frame)*3, CGRectGetHeight(self.frame));
        
    self.leftView = [[UIView alloc] initWithFrame:CGRectNull];
    self.middleView = [[UIView alloc] initWithFrame:CGRectNull];
    self.rightView = [[UIView alloc] initWithFrame:CGRectNull];
    [self recenterSubviews];
    [self addSubview:self.leftView];
    [self addSubview:self.middleView];
    [self addSubview:self.rightView];
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat width = CGRectGetWidth(self.frame);
    self.contentOffset = CGPointMake(width, 0);
    [self recenterSubviews];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat width = CGRectGetWidth(self.frame);
    
    if (self.contentOffset.x == 0) {
        UIView *temp = self.middleView;
        self.middleView = self.leftView;
        self.leftView = self.rightView;
        self.rightView = temp;
        [self recenterSubviews];
        if ([self.delegate respondsToSelector:@selector(infiniteScrollViewDidRecenter:)])
            [self.delegate infiniteScrollViewDidRecenter:self];
    } else if (self.contentOffset.x == width*2) {
        UIView *temp = self.middleView;
        self.middleView = self.rightView;
        self.rightView = self.leftView;
        self.leftView = temp;
        [self recenterSubviews];
        if ([self.delegate respondsToSelector:@selector(infiniteScrollViewDidRecenter:)])
            [self.delegate infiniteScrollViewDidRecenter:self];
    }
    
    //fix 奇怪的定位错误，有时 contentInset.bottom 会变化
    self.contentInset = UIEdgeInsetsZero;

    self.contentSize = CGSizeMake(width*3, height);
    self.leftView.height = height;
    self.middleView.height = height;
    self.rightView.height = height;
}

- (void)recenterSubviews
{
    CGFloat width = CGRectGetWidth(self.frame);
    self.contentOffset = CGPointMake(width, 0);
    
    CGRect rect = {.origin = CGPointZero, .size = self.frame.size};
    self.leftView.frame = rect;
    rect.origin.x = width;
    self.middleView.frame = rect;
    rect.origin.x = width*2;
    self.rightView.frame = rect;
}

- (void)scrollToLeft
{
    CGRect rect = {.origin = CGPointZero, .size = self.frame.size};
    [self scrollRectToVisible:rect animated:YES];
}

- (void)scrollToRight
{
    CGRect rect = {.origin = {.x = CGRectGetWidth(self.frame)*2, .y = 0}, .size = self.frame.size};
    [self scrollRectToVisible:rect animated:YES];
}

@end
