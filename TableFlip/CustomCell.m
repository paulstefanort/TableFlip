//
//  CustomCell.m
//  TableFlip
//
//  Created by Paul Stefan Ort on 3/3/16.
//  Copyright © 2016 pso.io. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell() {
    UIView *_card;
    
    UIView *_commentView;
    UITextView *_commentText;
    UILabel *_rankLabel;
    UILabel *_timeLabel;
    
    UIView *_votingView;
    UIButton *_upVote;
    UILabel *_countLabel;
    UIButton *_downVote;
}
@end

@implementation CustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.contentView.translatesAutoresizingMaskIntoConstraints = YES;
        
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupViewsAndConstraints];
    }
    return self;
}

- (void)presentValue:(NSString *)value {
    _commentText.text = value;
    _rankLabel.text = @"Presented";
    _countLabel.text = @"1";
    _timeLabel.text = @"10m";
}

- (void)upvotePressed {
    NSLog(@"upvoted");
}

- (void)downvotePressed {
    NSLog(@"downvoted");
}

# pragma mark - View Setup

- (void)setupViewsAndConstraints {
    [self setupCommentView];
    [self setupVotingView];
    [self setupCardView];
    [self setupConstraints];
}

- (void)setupCardView {
    _card = [UIView new];
    _card.translatesAutoresizingMaskIntoConstraints = NO;
    _card.backgroundColor = [UIColor whiteColor];
    _card.layer.cornerRadius = 3.0f;
    [_card addSubview:_commentView];
    [_card addSubview:_votingView];
    [self.contentView addSubview:_card];
}

- (void)setupCommentView {
    _commentView = [UIView new];
    _commentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _rankLabel = [UILabel new];
    _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rankLabel.textColor = [UIColor blueColor];
    _rankLabel.font = [UIFont systemFontOfSize:14.0f];
    
    _commentText = [UITextView new];
    _commentText.scrollEnabled = NO;
    _commentText.editable = NO;
    _commentText.selectable = NO;
    _commentText.backgroundColor = [UIColor clearColor];
    _commentText.translatesAutoresizingMaskIntoConstraints = NO;
    _commentText.textContainer.lineFragmentPadding = 0.0f;
    _commentText.textColor = [UIColor grayColor];
    _commentText.contentInset = UIEdgeInsetsZero;
    
    [_commentText setTextContainerInset:UIEdgeInsetsZero];
    [_commentText setLayoutMargins:UIEdgeInsetsZero];
    
    _timeLabel = [UILabel new];
    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _timeLabel.font = [UIFont systemFontOfSize:12.0f];
    
    [_commentView addSubview:_rankLabel];
    [_commentView addSubview:_commentText];
    [_commentView addSubview:_timeLabel];
}

- (void)setupVotingView {
    _votingView = [UIView new];
    _votingView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _upVote = [UIButton new];
    _upVote.translatesAutoresizingMaskIntoConstraints = NO;
    [_upVote setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_upVote setTitle:@"⌃" forState:UIControlStateNormal];
    [_upVote addTarget:self action:@selector(upvotePressed) forControlEvents:UIControlEventTouchUpInside];
    
    _countLabel = [UILabel new];
    _countLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _countLabel.textAlignment = NSTextAlignmentCenter;
    
    _downVote = [UIButton new];
    _downVote.translatesAutoresizingMaskIntoConstraints = NO;
    [_downVote setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_downVote setTitle:@"⌄" forState:UIControlStateNormal];
    [_downVote addTarget:self action:@selector(downvotePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [_votingView addSubview:_upVote];
    [_votingView addSubview:_countLabel];
    [_votingView addSubview:_downVote];
}

- (void)setupConstraints {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_card, _commentView, _rankLabel, _commentText, _timeLabel, _votingView, _upVote, _countLabel, _downVote);
    
    [self setupCommentViewConstraintsWithViews:viewsDictionary];
    [self setupVotingViewConstraintsWithViews:viewsDictionary];
    [self setupCardConstraintsWithViews:viewsDictionary];
}

- (void)setupCommentViewConstraintsWithViews:(NSDictionary *)viewsDictionary {
    [_commentView addConstraints: [NSLayoutConstraint
                                   constraintsWithVisualFormat:@"H:|-10-[_rankLabel]-10-|"
                                   options:0
                                   metrics:0
                                   views:viewsDictionary]];
    
    [_commentView addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"H:|-10-[_commentText]-10-|"
                                  options:0
                                  metrics:0
                                  views:viewsDictionary]];
    
    [_commentView addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"H:|-10-[_timeLabel]-10-|"
                                  options:0
                                  metrics:0
                                  views:viewsDictionary]];
    
    [_commentView addConstraints:[NSLayoutConstraint
                                  constraintsWithVisualFormat:@"V:|-10-[_rankLabel(==10)]-2-[_commentText(>=40)]-2-[_timeLabel(==10)]-10-|"
                                  options:0
                                  metrics:0
                                  views:viewsDictionary]];
}

- (void)setupVotingViewConstraintsWithViews:(NSDictionary *)viewsDictionary {
    [_votingView addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"H:|[_upVote]|"
                                 options:0
                                 metrics:0
                                 views:viewsDictionary]];
    
    [_votingView addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"H:|[_countLabel]|"
                                 options:0
                                 metrics:0
                                 views:viewsDictionary]];
    
    [_votingView addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"H:|[_downVote]|"
                                 options:0
                                 metrics:0
                                 views:viewsDictionary]];
    
    [_votingView addConstraints:[NSLayoutConstraint
                                 constraintsWithVisualFormat:@"V:|-10-[_upVote(==20)]-[_countLabel(<=40)]-[_downVote(==20)]-(>=10)-|"
                                 options:0
                                 metrics:0
                                 views:viewsDictionary]];
}

- (void)setupCardConstraintsWithViews:(NSDictionary *)viewsDictionary {
    [_card addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"H:|[_commentView]-10-[_votingView(40)]-10-|"
                           options:0
                           metrics:0
                           views:viewsDictionary]];
    
    [_card addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:|[_commentView(>=80)]|"
                           options:0
                           metrics:0
                           views:viewsDictionary]];
    
    [_card addConstraints:[NSLayoutConstraint
                           constraintsWithVisualFormat:@"V:|[_votingView]|"
                           options:0
                           metrics:0
                           views:viewsDictionary]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"H:|-10-[_card]-10-|"
                                      options:0
                                      metrics:0
                                      views:viewsDictionary]];
    
    [self.contentView addConstraints:[NSLayoutConstraint
                                      constraintsWithVisualFormat:@"V:|-10-[_card]|"
                                      options:0
                                      metrics:0
                                      views:viewsDictionary]];
}

@end
