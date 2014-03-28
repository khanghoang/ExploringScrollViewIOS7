//
//  TKViewController.m
//  DemoApp
//
//  Created by Triệu Khang on 28/3/14.
//  Copyright (c) 2014 Triệu Khang. All rights reserved.
//

#import "TKViewController.h"
#import "UIView+AutoLayout.h"

@interface TKViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end

@implementation TKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.containView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.containView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

//    NSDictionary *views = @{@"beeView":self.containView};
//
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[beeView(6000)]|" options:kNilOptions metrics:nil views:views]];
//    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[beeView(9000)]|" options:kNilOptions metrics:nil views:views]];
}

@end
