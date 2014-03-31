//
//  TKViewController.m
//  DemoApp
//
//  Created by Triệu Khang on 28/3/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKViewController.h"
#import "UIView+AutoLayout.h"
#import "TKScrollCell.h"

CGFloat _random() { return (float)rand() / (float)RAND_MAX;}

@interface TKViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
TKScrollCellProtocol
>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.containView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TKScrollCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TKScrollCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKScrollCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TKScrollCell class])
                                                               forIndexPath:indexPath];

    CGFloat red = _random();
    CGFloat green = _random();
    CGFloat blue = _random();

    [scrollCell setScrollViewBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0f]];
    scrollCell.delegate = self;

    return scrollCell;
}

#pragma mark - TKScrollCell delegate

- (void)scrollingCellDidBeginPull:(id)cell
{
    self.scrollView.scrollEnabled = NO;
}

- (void)scrollingCell:(id)cell pullOutterWithOffset:(NSNumber *)offset
{
    [self.scrollView setContentOffset:CGPointMake([offset floatValue], 0)];
    self.scrollView.scrollEnabled = YES;
}

- (void)scrollingCellDidEndPull:(id)cell
{
    self.scrollView.scrollEnabled = YES;
}

@end
