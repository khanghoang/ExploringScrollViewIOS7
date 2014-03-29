//
//  TKScrollCell.m
//  ExploringScrollViewIOS7
//
//  Created by Triệu Khang on 28/3/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKScrollCell.h"
#import "UIView+AutoLayout.h"

@interface TKScrollCell ()
<
UIScrollViewDelegate
>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation TKScrollCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.containView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)setScrollViewBackgroundColor:(UIColor *)color
{
    self.containView.backgroundColor = color;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.x;

    if(offset > 60)
        return;
    
    if ([self.delegate respondsToSelector:@selector(beginScrollWithCell:)]) {
        [self.delegate performSelector:@selector(beginScrollWithCell:) withObject:self];
    }
}

@end
