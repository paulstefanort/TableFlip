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
        // no self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _card = [UIView new];
        _card.translatesAutoresizingMaskIntoConstraints = NO;
        _card.backgroundColor = [UIColor whiteColor];
        _card.layer.cornerRadius = 3.0f;
        
        [self setupCommentView];
        [self setupVotingView];
        
        [_card addSubview:_commentView];
        [_card addSubview:_votingView];
        [self.contentView addSubview:_card];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupCommentView {
    _commentView = [UIView new];
    _commentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _rankLabel = [UILabel new];
    _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _rankLabel.backgroundColor = [UIColor darkGrayColor];
    _rankLabel.textColor = [UIColor whiteColor];
    _rankLabel.font = [UIFont systemFontOfSize:12.0f];
    
    _commentLabel = [UILabel new];
    _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _commentLabel.backgroundColor = [UIColor grayColor];
    _commentLabel.textColor = [UIColor blackColor];
    _commentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _commentLabel.numberOfLines = 0;
    
    [_commentView addSubview:_rankLabel];
    [_commentView addSubview:_commentLabel];
}

- (void)setupVotingView {
    _votingView = [UIView new];
    _votingView.translatesAutoresizingMaskIntoConstraints = NO;
    
    _upVote = [UIButton new];
    _upVote.translatesAutoresizingMaskIntoConstraints = NO;
    _upVote.backgroundColor = [UIColor blueColor];
    
    _countLabel = [UILabel new];
    _countLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _downVote = [UIButton new];
    _downVote.translatesAutoresizingMaskIntoConstraints = NO;
    _downVote.backgroundColor = [UIColor blueColor];
    
    [_votingView addSubview:_upVote];
    [_votingView addSubview:_countLabel];
    [_votingView addSubview:_downVote];
}

- (void)setupConstraints {
    NSArray *rankHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_rankLabel]-10-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:NSDictionaryOfVariableBindings(_rankLabel)];
    [_commentView addConstraints:rankHorizontalConstraints];
    
    NSArray *commentHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_commentLabel]-10-|"
                                                                                    options:0
                                                                                    metrics:0
                                                                                      views:NSDictionaryOfVariableBindings(_commentLabel)];
    [_commentView addConstraints:commentHorizontalConstraints];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_rankLabel(10)]-2-[_commentLabel(>=40)]-10-|"
                                                                           options:0
                                                                           metrics:0
                                                                             views:NSDictionaryOfVariableBindings(_commentLabel, _rankLabel)];
    [_commentView addConstraints:verticalConstraints];
    
    NSArray *cardSectionsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_commentView]-10-[_votingView(40)]-10-|"
                                                                                         options:0
                                                                                         metrics:0
                                                                                           views:NSDictionaryOfVariableBindings(_commentView, _votingView)];
    [_card addConstraints:cardSectionsHorizontalConstraints];
    
    NSArray *commentViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_commentView]|"
                                                                                      options:0
                                                                                      metrics:0
                                                                                        views:NSDictionaryOfVariableBindings(_commentView)];
    [_card addConstraints:commentViewVerticalConstraints];
    
    NSArray *upvoteHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_upVote]|"
                                                                                   options:0
                                                                                   metrics:0
                                                                                     views:NSDictionaryOfVariableBindings(_upVote)];
    [_votingView addConstraints:upvoteHorizontalConstraints];
    
    NSArray *countHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_countLabel]|"
                                                                                  options:0
                                                                                  metrics:0
                                                                                    views:NSDictionaryOfVariableBindings(_countLabel)];
    [_votingView addConstraints:countHorizontalConstraints];
    
    NSArray *downvoteHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_downVote]|"
                                                                                     options:0
                                                                                     metrics:0
                                                                                       views:NSDictionaryOfVariableBindings(_downVote)];
    [_votingView addConstraints:downvoteHorizontalConstraints];
    
    NSArray *votingVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_upVote(20)]-[_countLabel]-[_downVote(20)]-10-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:NSDictionaryOfVariableBindings(_upVote, _countLabel, _downVote)];
    [_votingView addConstraints:votingVerticalConstraints];
    
    NSArray *votingViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_votingView]|"
                                                                                     options:0
                                                                                     metrics:0
                                                                                       views:NSDictionaryOfVariableBindings(_votingView)];
    [_card addConstraints:votingViewVerticalConstraints];
    
    NSArray *cardHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_card]-20-|"
                                                                                 options:0
                                                                                 metrics:0
                                                                                   views:NSDictionaryOfVariableBindings(_card)];
    [self.contentView addConstraints:cardHorizontalConstraints];
    
    NSArray *cardVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_card]-10-|"
                                                                               options:0
                                                                               metrics:0
                                                                                 views:NSDictionaryOfVariableBindings(_card)];
    [self.contentView addConstraints:cardVerticalConstraints];
}

- (void)presentValue:(NSString *)value {
    _commentLabel.text = value;
    _rankLabel.text = @"Presented";
    _countLabel.text = @"1";
}

@end
