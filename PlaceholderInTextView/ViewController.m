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
    //设置占位符(一行代码即可完成设置)
    self.textView.placeholder = [self attributePlaceholder:@"这是占位符"];
    
    
    
    
    
    //设置代理,如果需要保留占位符请不要直接设置delegate(可选)
    self.textView.cxj_delegate = self;

}

#pragma mark - UITextViewDelegate重要
-(void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"内容改变了");
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
