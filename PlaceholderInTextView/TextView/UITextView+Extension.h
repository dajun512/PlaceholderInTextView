//
//  UITextView+Extension.h
//  objectChat
//
//  Created by pro on 2018/6/7.
//  Copyright © 2018年 pro. All rights reserved.
//  1.使用方法,导入头文件
//  2.设置placeholder
//  3.(可选)当需要实现代理时,请设置cxj_delegate,而不是直接delegate

#import <UIKit/UIKit.h>

@interface UITextView (Extension)


/** placeHolder */
@property (nonatomic,copy) NSAttributedString *placeholder;

/** 设置代理 */
@property (nonatomic,weak) id<UITextViewDelegate> cxj_delegate;


@end
