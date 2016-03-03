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
        
        _commentView = [UIView new];
        _commentView.translatesAutoresizingMaskIntoConstraints = NO;
        
        _rankLabel = [UILabel new];
        _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _rankLabel.backgroundColor = [UIColor darkGrayColor];
        _rankLabel.textColor = [UIColor whiteColor];

        _commentLabel = [UILabel new];
        _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _commentLabel.backgroundColor = [UIColor grayColor];
        _commentLabel.textColor = [UIColor blackColor];
        _commentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _commentLabel.numberOfLines = 0;
        
        [_commentView addSubview:_rankLabel];
        [_commentView addSubview:_commentLabel];
        
        [_card addSubview:_commentView];
        [self.contentView addSubview:_card];
        
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
        
        NSArray *commentViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_commentView]|"
                                                                                            options:0
                                                                                            metrics:0
                                                                                              views:NSDictionaryOfVariableBindings(_commentView)];
        [_card addConstraints:commentViewHorizontalConstraints];
        
        NSArray *commentViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_commentView]|"
                                                                                          options:0
                                                                                          metrics:0
                                                                                            views:NSDictionaryOfVariableBindings(_commentView)];
        [_card addConstraints:commentViewVerticalConstraints];
        
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
    return self;
}

- (void)presentValue:(NSString *)value {
    _commentLabel.text = value;
    _rankLabel.text = @"Presented";
}

@end
