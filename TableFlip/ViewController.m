//
//  ViewController.m
//  TableFlip
//
//  Created by Paul Stefan Ort on 3/3/16.
//  Copyright © 2016 pso.io. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController () {
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupViewsAndConstraints];
}

- (void)setupViewsAndConstraints {
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self setupTableView];
    [self setupConstraints];
}

- (void)setupTableView {
    _tableView = [UITableView new];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 80.0f;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[CustomCell class] forCellReuseIdentifier:@"cellIdentifier"];
    
    [self.view addSubview:_tableView];
}

- (void)setupConstraints {
    [self.view addConstraint:[NSLayoutConstraint
                               constraintWithItem:_tableView
                               attribute:NSLayoutAttributeTop
                               relatedBy:NSLayoutRelationEqual
                               toItem:self.view
                               attribute:NSLayoutAttributeTop
                               multiplier:1.0f
                               constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_tableView
                              attribute:NSLayoutAttributeBottom
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeBottom
                              multiplier:1.0f
                              constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_tableView
                              attribute:NSLayoutAttributeLeadingMargin
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeLeading
                              multiplier:1.0f
                              constant:0.0f]];
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:_tableView
                              attribute:NSLayoutAttributeTrailingMargin
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.view
                              attribute:NSLayoutAttributeTrailing
                              multiplier:1.0f
                              constant:0.0f]];
}

# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *value;
    if (indexPath.row % 2 == 0) {
        value = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus lacinia mollis purus et efficitur. Donec ac mi at urna semper mollis. Ut hendrerit rutrum lorem vel blandit. Ut accumsan ex vel lectus consequat, elementum lacinia neque tempor. Integer nec massa sit amet ante interdum dapibus.";
    } else {
        value = @"Some comment";
    }
    [cell presentValue:value];
    return cell;
}

# pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
