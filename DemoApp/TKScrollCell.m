//
//  TKScrollCell.m
//  ExploringScrollViewIOS7
//
//  Created by Triệu Khang on 28/3/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKScrollCell.h"
#import "UIView+AutoLayout.h"

#define PULL_THRESHOLD 60

@interface TKScrollCell ()
<
UIScrollViewDelegate
>

@property (assign, nonatomic) BOOL isPulling;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation TKScrollCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(640, 89);
}

- (void)setScrollViewBackgroundColor:(UIColor *)color
{
    self.containView.backgroundColor = color;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.scrollView.contentOffset.x;

    // should we start pulling?
    if(offset > PULL_THRESHOLD && !_isPulling)
    {
        if ([self.delegate respondsToSelector:@selector(scrollingCellDidBeginPull:)]) {
            [self.delegate performSelector:@selector(scrollingCellDidBeginPull:) withObject:self];
        }

        self.isPulling = YES;
    }

    if (self.isPulling) {
        CGFloat scrollDistance = MAX(0, offset - PULL_THRESHOLD);
        if ([self.delegate respondsToSelector:@selector(scrollingCell:pullOutterWithOffset:)]) {
            [self.delegate performSelector:@selector(scrollingCell:pullOutterWithOffset:) withObject:self withObject:@(scrollDistance)];
        }
    }

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        if ([self.delegate respondsToSelector:@selector(scrollingCellDidEndPull:)]) {
            [self.delegate performSelector:@selector(scrollingCellDidEndPull:)];
            self.scrollView.contentOffset = CGPointZero;
            self.scrollView.transform = CGAffineTransformIdentity;
            self.isPulling = NO;
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([self.delegate respondsToSelector:@selector(scrollingCellDidEndPull:)]) {
        [self.delegate performSelector:@selector(scrollingCellDidEndPull:)];
        self.scrollView.contentOffset = CGPointZero;
        self.scrollView.transform = CGAffineTransformIdentity;
        self.isPulling = NO;
    }
}
@end
