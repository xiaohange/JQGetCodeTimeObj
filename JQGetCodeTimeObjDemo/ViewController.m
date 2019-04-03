//
//  ViewController.m
//  JQGetCodeTimeObjDemo
//
//  Created by DuoLa on 2019/4/3.
//  Copyright © 2019 Hari. All rights reserved.
//

#import "ViewController.h"
#import "JQGetCodeTimeObj.h"

@interface ViewController ()<GetCodeTimeObjDelegate>
{
    JQGetCodeTimeObj *_getCodeTimeObj;
}
@property (nonatomic, strong) UIButton *codeButton;
@end

@implementation ViewController

- (void)dealloc
{
    [_getCodeTimeObj stopCountDown];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.codeButton];
}

- (UIButton *)codeButton
{
    if (!_codeButton) {
        _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _codeButton.frame = CGRectMake(100, 200, 150, 40);
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeButton.backgroundColor = [UIColor blackColor];
        [_codeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_codeButton addTarget:self action:@selector(sendCodeAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _codeButton;
}

- (void)sendCodeAction:(id)sender
{
    [self.codeButton setTitle:@"重新获取" forState:UIControlStateNormal];
    [self startCountDown];
}

- (void)startCountDown
{
    if (!_getCodeTimeObj) {
        _getCodeTimeObj = [[JQGetCodeTimeObj alloc] init];
        _getCodeTimeObj.delegate = self;
    }
    [_getCodeTimeObj startCountDown];
}

#pragma mark - GetCodeTimeObjDelegate

- (void)onFinishTime:(JQGetCodeTimeObj *)obj
{
    NSString* str = [NSString stringWithFormat:@"%@",@"重新获取"];
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]  initWithString:str];
    [attriString addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, 4)];
    [self.codeButton setAttributedTitle:attriString forState:UIControlStateNormal];
    self.codeButton.userInteractionEnabled = YES;
}

- (void)onGoingTime:(JQGetCodeTimeObj *)obj time:(NSInteger)time
{
    self.codeButton.userInteractionEnabled = NO ;
    NSString* timeStr = [NSString stringWithFormat:@"%@",@(time)];
    NSString* str = [NSString stringWithFormat:@"%@秒后重新获取",timeStr];
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]  initWithString:str];
    NSInteger length = [timeStr length];
    [attriString addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(0, length)];
    [attriString addAttribute:NSForegroundColorAttributeName
                        value:[UIColor whiteColor]
                        range:NSMakeRange(length, [str length]-length)];
    [self.codeButton setAttributedTitle:attriString forState:UIControlStateNormal];
}


@end
