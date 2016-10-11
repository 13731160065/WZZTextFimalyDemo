//
//  WZZTextDetailVC.m
//  WZZTextFimalyDemo
//
//  Created by 王泽众 on 16/10/11.
//  Copyright © 2016年 wzz. All rights reserved.
//

#import "WZZTextDetailVC.h"

@interface WZZTextDetailVC ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UISlider *fontSlider;

@end

@implementation WZZTextDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _text = @"0123456789\nabcdefghijklmnopqrstuvwxyz\n你好，中文\n~!@#$%^&*(){}|:\"<>?,./;'[]\\-=\n";
    [_textView setText:_text];
    [_textView setFont:[UIFont fontWithName:_fontName size:15]];
    [_textView becomeFirstResponder];
    [_fontSlider setMinimumValue:1];
    [_fontSlider setMaximumValue:40];
    _fontSlider.value = 15;
}
- (IBAction)valueClick:(UISlider *)sender {
    [_textView setFont:[UIFont fontWithName:_fontName size:sender.value]];
}

- (IBAction)cancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
