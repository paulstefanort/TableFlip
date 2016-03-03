//
//  CustomCell.m
//  TableFlip
//
//  Created by Paul Stefan Ort on 3/3/16.
//  Copyright © 2016 pso.io. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell() {
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

        _commentLabel = [UILabel new];
        _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _commentLabel.backgroundColor = [UIColor grayColor];
        _commentLabel.textColor = [UIColor blackColor];
        
        _rankLabel = [UILabel new];
        _rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _rankLabel.backgroundColor = [UIColor darkGrayColor];
        _rankLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_commentLabel];
        [self.contentView addSubview:_rankLabel];
        
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_commentLabel]-10-[_rankLabel]-20-|"
                                                                                 options:NSLayoutFormatAlignAllTop
                                                                                 metrics:nil
                                                                                   views:NSDictionaryOfVariableBindings(_commentLabel, _rankLabel)];
        [self.contentView addConstraints:horizontalConstraints];
        
        NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_commentLabel(60)]-10-|"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:NSDictionaryOfVariableBindings(_commentLabel)];
        [self.contentView addConstraints:verticalConstraints];
    }
    return self;
}

- (void)presentValue:(NSString *)value {
    _commentLabel.text = value;
    _rankLabel.text = @"Presented";
}

@end
