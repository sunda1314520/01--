//
//  ViewController.m
//  01-加法计算器(代码实现)
//
//  Created by sunda on 15/6/29.
//  Copyright (c) 2015年 sunda. All rights reserved.
//

#import "ViewController.h"

#define kPaddiing 20

@interface ViewController ()
//结果
@property (nonatomic,strong) UILabel *ResultLable;
//计算按钮
@property (nonatomic,strong) UIButton *CalculationButton;
//第一个文本框
@property (nonatomic,strong) UITextField *name1;
//第二个文本框
@property (nonatomic,strong) UITextField *name2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //=================创建第一个文本框=============//
    //1、创建文本框
    self.name1 = [[UITextField alloc] init];
    //设置位置
    self.name1.frame = CGRectMake(20, 20, 80, 30);
    //UITextBorderStyle
    self.name1.borderStyle = UITextBorderStyleRoundedRect;
    //设置弹出键盘的样式
    self.name1.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.name1];
    
    //=================创建 + lable=================//
    UILabel *numbel1 = [[UILabel alloc] init];
    //获取name1的最大的X
    CGFloat numbel1X = CGRectGetMaxX(self.name1.frame) + kPaddiing;
    numbel1.frame = CGRectMake(numbel1X, 20, 10, 30) ;
    numbel1.text = @"+";
    [self.view addSubview:numbel1];
    
    //=================创建第二个文本框=============//
    self.name2 = [[UITextField alloc] init];
    CGFloat name2X = CGRectGetMaxX(numbel1.frame) + kPaddiing;
    //设置位置
    self.name2.frame = CGRectMake(name2X, 20, 80, 30);
    //UITextBorderStyle
    self.name2.borderStyle = UITextBorderStyleRoundedRect;
    //设置弹出键盘的样式
    self.name1.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:self.name2];

    //=================创建 = lable=================//
    UILabel *numbel2 = [[UILabel alloc] init];
    //获取name1的最大的X
    CGFloat numbel2X = CGRectGetMaxX(self.name2.frame) + kPaddiing;
    numbel2.frame = CGRectMake(numbel2X, 20, 10, 30) ;
    numbel2.text = @"=";
    [self.view addSubview:numbel2];
    
    //================创建 结果 lable==============//
    self.ResultLable = [[UILabel alloc] init];
    CGFloat ResultLableX = CGRectGetMaxX(numbel2.frame) + kPaddiing;
    self.ResultLable.frame = CGRectMake(ResultLableX, 20, 80, 30);
    self.ResultLable.text = @"0";
    [self.view addSubview:self.ResultLable];
    
    //===============创建计算结果按钮==============//
    self.CalculationButton = [[UIButton alloc] init];
    self.CalculationButton.frame = CGRectMake(150, 100, 50, 50);
    [self.CalculationButton setTitle:@"计算" forState:UIControlStateNormal];
    [self.CalculationButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.CalculationButton];
    //添加点击事件
    [self.CalculationButton addTarget:self action:@selector(Calculation) forControlEvents:UIControlEventTouchUpInside];
}

- (void)Calculation
{
    NSLog(@"%@------%@",self.name1.text,self.name2.text);
    float num1 = self.name1.text.integerValue;
    float num2 = self.name2.text.integerValue;
    self.ResultLable.text = [NSString stringWithFormat:@"%.2f",num1+num2];
    //关闭键盘
    [self.view endEditing:YES];
}



@end
