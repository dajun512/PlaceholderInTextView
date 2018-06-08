//
//  UITextView+Extension.m
//  objectChat
//
//  Created by pro on 2018/6/7.
//  Copyright © 2018年 pro. All rights reserved.
//

#import "UITextView+Extension.h"
#import <objc/runtime.h>


@implementation UITextView (Extension)

+(void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setText:)), class_getInstanceMethod(self, @selector(setCxj_Text:)));
}


//用代码创建时判断
-(void)setCxj_Text:(NSString *)text
{
    [self setCxj_Text:text];
    [self setInitPlaceholder];
}

//设置隐藏或显示
-(void)setInitPlaceholder
{
    if (self.placeholder) {
        self.placeholderLabel.hidden = (self.text.length > 0);
    }
}



#pragma mark - 设置保存代理对象
-(void)setCxj_delegate:(id<UITextViewDelegate>)cxj_delegate
{
    self.delegate = (id<UITextViewDelegate>)self;
    objc_setAssociatedObject(self, @selector(cxj_delegate), cxj_delegate, OBJC_ASSOCIATION_ASSIGN);
}

-(id<UITextViewDelegate>)cxj_delegate
{
    return objc_getAssociatedObject(self, _cmd);
}


-(void)setPlaceholder:(NSAttributedString *)placeholder
{
    objc_setAssociatedObject(self, @selector(placeholder), placeholder, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (self.delegate == nil) self.delegate = (id<UITextViewDelegate>)self;
    [self setInitPlaceholder];
}
-(NSAttributedString *)placeholder
{
    return objc_getAssociatedObject(self, _cmd);
}


//设置placeholder
-(void)setPlaceholderLabel:(UILabel *)placeholderLabel
{
    objc_setAssociatedObject(self, @selector(placeholderLabel), placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//懒加载placeholder
-(UILabel *)placeholderLabel
{
    UILabel *label = objc_getAssociatedObject(self, _cmd);
    if (label == nil) {
        CGFloat labelH = [@"textView" sizeWithAttributes:@{NSFontAttributeName:self.font}].height;
        CGFloat labelW = self.frame.size.width - self.textContainer.lineFragmentPadding * 2;
        CGRect superRect = CGRectMake(self.textContainer.lineFragmentPadding, self.textContainerInset.top, labelW, labelH);
        label = [[UILabel alloc] initWithFrame:superRect];
        label.font = self.font;
        label.textColor = [UIColor colorWithWhite:190/256.0 alpha:1.0];
        label.hidden = YES;
        label.userInteractionEnabled = NO;
        [self addSubview:label];
        [self setPlaceholderLabel:label];
    }
    label.attributedText = self.placeholder;
    return label;
}







#pragma mark - delegate
- (void)textViewDidChange:(UITextView *)textView
{
    [self setInitPlaceholder];
    if ([self.cxj_delegate conformsToProtocol:@protocol(UITextViewDelegate)]) {
        if ([self.cxj_delegate respondsToSelector:@selector(textViewDidChange:)]) {
            [self.cxj_delegate textViewDidChange:self];
        }
    }

    
}

@end
