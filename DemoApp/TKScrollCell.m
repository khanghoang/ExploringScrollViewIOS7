//
//  TKScrollCell.m
//  ExploringScrollViewIOS7
//
//  Created by Triệu Khang on 28/3/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKScrollCell.h"

@interface TKScrollCell ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation TKScrollCell

- (void)setScrollViewBackgroundColor:(UIColor *)color
{
    self.scrollView.backgroundColor = color;
}

@end
