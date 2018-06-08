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
    Method textM = class_getInstanceMethod(self, @selector(setText:));
    Method cxjTextM = class_getInstanceMethod(self, @selector(setCxj_Text:));
    method_exchangeImplementations(textM, cxjTextM);
}



//用xib创建时判断
-(void)awakeFromNib
{
    [super awakeFromNib];

    [self setInitPlaceholder];

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
    self.placeholderLabel.hidden = (self.text.length > 0);
}



//设置placeholderLabel
-(void)setPlaceholderLabel:(UILabel *)placeholderLabel
{
    objc_setAssociatedObject(self, @selector(placeholderLabel), placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

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
        [self setPlaceholderLabel:label];
    }
    if (label.superview == nil) {
        [self addSubview:label];
    }
    
    return label;
}


//当内容改变时
-(void)textViewDidChange
{
    [self setInitPlaceholder];
}



@end
