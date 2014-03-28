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

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.containView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

@end
