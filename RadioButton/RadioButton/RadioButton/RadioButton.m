//
//  RadioButton.m
//  RadioButton
//
//  Created by cyruschang on 2018/11/21.
//  Copyright © 2018 hualala. All rights reserved.
//

#import "RadioButton.h"
#import <Masonry/Masonry.h>

CGFloat const kRBInnerMargin = 10.0f;

@interface RadioButton ()

@property (nonatomic, strong) UIButton *optionOne;
@property (nonatomic, strong) UIButton *optionTwo;

@end

@implementation RadioButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultSelectedIndex = 0;
        self.currentSelectedIndex = 0;
        [self initInnerUI];
    }
    return self;
}

- (void)initInnerUI {
    [self addSubview:({
        self->_optionOne = [[UIButton alloc] init];
        [self->_optionOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        self->_optionOne.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self->_optionOne setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
        [self->_optionOne setImage:[UIImage imageNamed:@"unselected"] forState:UIControlStateNormal];
        self->_optionOne.tag = 1;
        [self->_optionOne addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self->_optionOne.selected = YES;
        self->_optionOne;
    })];
    
    [self addSubview:({
        self->_optionTwo = [[UIButton alloc] init];
        [self->_optionTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self->_optionTwo setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
        [self->_optionTwo setImage:[UIImage imageNamed:@"unselected"] forState:UIControlStateNormal];
        self->_optionTwo.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self->_optionTwo.tag = 2;
        [self->_optionTwo addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self->_optionTwo.selected = NO;
        self->_optionTwo;
    })];
}

#pragma mark - target methods

- (void)buttonClick:(UIButton *)button {
    button.selected = YES;
    NSInteger otherTag = !(button.tag - 1) + 1;
    UIButton *other = [self viewWithTag:otherTag];
    other.selected = NO;
    
    self.currentSelectedIndex = otherTag - 1;
    NSLog(@"当前点击了%ld", self.currentSelectedIndex);
}

#pragma mark - setters

- (void)setOptions:(NSArray *)options {
    _options = options;
    [_optionOne setTitle:_options[0] forState:UIControlStateNormal];
    [_optionTwo setTitle:_options[1] forState:UIControlStateNormal];
}

#pragma mark - frame

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_optionOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-kRBInnerMargin * 2);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_optionOne.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_optionOne.mas_left).offset(kRBInnerMargin);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        make.right.equalTo(self->_optionOne.titleLabel.mas_left).offset(-kRBInnerMargin);
    }];
    
    [_optionTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(kRBInnerMargin * 2);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_optionTwo.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_optionTwo.mas_left).offset(kRBInnerMargin);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        make.right.equalTo(self->_optionTwo.titleLabel.mas_left).offset(-kRBInnerMargin);
    }];
}



@end
