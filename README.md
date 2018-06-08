#为UITextView 增加占位符属性,可任意设置样式#

#超简单使用说明: #

1.导入UITextView+Extension分类

2.设置占位文字
	textView.placeholderLabel.text = @"占位符"; //普通文字
	或
	textView.placeholderLabel.attributedText = attr; //多属性文字
	
3.设置代理并实现-(void)textViewDidChange:(UITextView *)textView
  在该方法中调用 [textView textViewDidChange];

其实比UILabel的占位符也就多了一个步骤 在代理方法中调用文字改变的方法,可自行下载demo


![Snip](https://github.com/dajun512/PlaceholderInTextView/blob/master/UITextViewPlaceholder.gif?raw=true)
