//
//  RadioButton.h
//  RadioButton
//
//  Created by cyruschang on 2018/11/21.
//  Copyright © 2018 hualala. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadioButton;

@protocol RadioButtonDelegate <NSObject>

- (void)radioButton:(RadioButton *)button didSelectButtonAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_BEGIN

@interface RadioButton : UIView
// 按钮的选项
@property (nonatomic, strong) NSArray *options;
// 默认选中的
@property (nonatomic, assign) NSInteger defaultSelectedIndex;
// 当前选中的
@property (nonatomic, assign) NSInteger currentSelectedIndex;


@end

NS_ASSUME_NONNULL_END
