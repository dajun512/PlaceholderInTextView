//
//  ViewController.m
//  PlaceholderInTextView
//
//  Created by pro on 2018/6/7.
//  Copyright © 2018年 ChenXiaoJun. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+Extension.h"
@interface ViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.设置占位符
    self.textView.placeholderLabel.attributedText = [self attributePlaceholder:@"这是占位符"];
    //2.设置代理
    self.textView.delegate = self;

}

#pragma mark - UITextViewDelegate重要
-(void)textViewDidChange:(UITextView *)textView
{
    //3.一定记得在这里调用分类的textViewDidChange
    [self.textView textViewDidChange];
}















//多属性文本
-(NSMutableAttributedString *)attributePlaceholder:(NSString *)placeholder
{
    NSMutableAttributedString *multString = [[NSMutableAttributedString alloc] initWithString:placeholder attributes:@{NSFontAttributeName:self.textView.font,NSForegroundColorAttributeName:[UIColor colorWithWhite:190/256.0 alpha:1.0f]}];
    NSAttributedString *xingString = [[NSAttributedString alloc] initWithString:@"*" attributes:@{NSFontAttributeName:self.textView.font,NSForegroundColorAttributeName:[UIColor redColor]}];
    
    [multString appendAttributedString:xingString];
    
    return multString;
}


@end
