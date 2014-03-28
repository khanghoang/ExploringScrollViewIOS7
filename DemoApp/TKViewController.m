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

@interface TKViewController ()
<
UITableViewDelegate,
UITableViewDataSource
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TKScrollCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TKScrollCell class]) forIndexPath:indexPath];
    return scrollCell;
}

@end
