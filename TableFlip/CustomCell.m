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
    UILabel *_commentLabel;
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
        
        [self setupCommentView];
        [self setupVotingView];
        [self setupCardView];
        [self setupConstraints];
    }
    return self;
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
    _rankLabel.font = [UIFont systemFontOfSize:12.0f];
    
    _commentLabel = [UILabel new];
    _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _commentLabel.textColor = [UIColor grayColor];
    _commentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _commentLabel.numberOfLines = 0;
    
    _timeLabel = [UILabel new];
    _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _timeLabel.font = [UIFont systemFontOfSize:10.0f weight:UIFontWeightLight];
    
    [_commentView addSubview:_rankLabel];
    [_commentView addSubview:_commentLabel];
    [_commentView addSubview:_timeLabel];
}

- (void)setupVotingView {
    _votingView = [UIView new];
    _votingView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _upVote = [UIButton new];
    _upVote.translatesAutoresizingMaskIntoConstraints = NO;
    _upVote.backgroundColor = [UIColor blueColor];
    [_upVote addTarget:self action:@selector(upvotePressed) forControlEvents:UIControlEventTouchUpInside];
    
    _countLabel = [UILabel new];
    _countLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _countLabel.textAlignment = NSTextAlignmentCenter;
    
    _downVote = [UIButton new];
    _downVote.translatesAutoresizingMaskIntoConstraints = NO;
    _downVote.backgroundColor = [UIColor blueColor];
    [_downVote addTarget:self action:@selector(downvotePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [_votingView addSubview:_upVote];
    [_votingView addSubview:_countLabel];
    [_votingView addSubview:_downVote];
}

- (void)setupConstraints {
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_card, _commentView, _rankLabel, _commentLabel, _timeLabel, _votingView, _upVote, _countLabel, _downVote);
    
    NSArray *rankHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_rankLabel]-10-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:viewsDictionary];
    [_commentView addConstraints:rankHorizontalConstraints];
    
    NSArray *commentHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_commentLabel]-10-|"
                                                                                    options:0
                                                                                    metrics:0
                                                                                      views:viewsDictionary];
    [_commentView addConstraints:commentHorizontalConstraints];
    
    NSArray *timeHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_timeLabel]-10-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:viewsDictionary];
    [_commentView addConstraints:timeHorizontalConstraints];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_rankLabel(==10)]-2-[_commentLabel(>=40)]-2-[_timeLabel(==10)]-10-|"
                                                                           options:0
                                                                           metrics:0
                                                                             views:viewsDictionary];
    [_commentView addConstraints:verticalConstraints];
    
    NSArray *cardSectionsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_commentView]-10-[_votingView(40)]-10-|"
                                                                                         options:0
                                                                                         metrics:0
                                                                                           views:viewsDictionary];
    [_card addConstraints:cardSectionsHorizontalConstraints];
    
    NSArray *commentViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_commentView(>=80)]|"
                                                                                      options:0
                                                                                      metrics:0
                                                                                        views:viewsDictionary];
    [_card addConstraints:commentViewVerticalConstraints];
    
    NSArray *upvoteHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_upVote]|"
                                                                                   options:0
                                                                                   metrics:0
                                                                                     views:viewsDictionary];
    [_votingView addConstraints:upvoteHorizontalConstraints];
    
    NSArray *countHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_countLabel]|"
                                                                                  options:0
                                                                                  metrics:0
                                                                                    views:viewsDictionary];
    [_votingView addConstraints:countHorizontalConstraints];
    
    NSArray *downvoteHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_downVote]|"
                                                                                     options:0
                                                                                     metrics:0
                                                                                       views:viewsDictionary];
    [_votingView addConstraints:downvoteHorizontalConstraints];
    
    NSArray *votingVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_upVote(==20)]-[_countLabel(<=40)]-[_downVote(==20)]-(>=10)-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:viewsDictionary];
    [_votingView addConstraints:votingVerticalConstraints];
    
    NSArray *votingViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_votingView]|"
                                                                                     options:0
                                                                                     metrics:0
                                                                                       views:viewsDictionary];
    [_card addConstraints:votingViewVerticalConstraints];
    
    NSArray *cardHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_card]-20-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:viewsDictionary];
    [self.contentView addConstraints:cardHorizontalConstraints];
    
    NSArray *cardVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_card]-10-|"
                                                                               options:0
                                                                               metrics:0
                                                                                 views:viewsDictionary];
    [self.contentView addConstraints:cardVerticalConstraints];
}

- (void)presentValue:(NSString *)value {
    _commentLabel.text = value;
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

@end
