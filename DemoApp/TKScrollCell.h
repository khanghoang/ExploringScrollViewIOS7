//
//  TKScrollCell.h
//  ExploringScrollViewIOS7
//
//  Created by Triệu Khang on 28/3/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TKScrollCellProtocol <NSObject>

- (void)scrollingCellDidBeginPull:(id)cell;
- (void)scrollingCell:(id)cell pullOutterWithOffset:(CGFloat)offset;
- (void)scrollingCellDidEndPull:(id)cell;

@end

@interface TKScrollCell : UITableViewCell

@property (nonatomic, weak) id<TKScrollCellProtocol> delegate;

- (void)setScrollViewBackgroundColor:(UIColor *)color;

@end
