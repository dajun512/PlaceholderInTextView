//
//  UITextView+Extension.h
//  objectChat
//
//  Created by pro on 2018/6/7.
//  Copyright © 2018年 pro. All rights reserved.
//  1.使用方法,导入头文件
//  2.设置placeholderLabel的text或attributext
//  3.在代理方法- (void)textViewDidChange:(UITextView *)textView中调用当前分类的textViewDidChange方法

#import <UIKit/UIKit.h>

@interface UITextView (Extension)


/** 占位Label */
@property (nonatomic,strong) UILabel *placeholderLabel;

//文本改变时调用此方法
-(void)textViewDidChange;


@end
