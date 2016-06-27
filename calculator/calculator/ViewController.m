//
//  ViewController.m
//  calculator
//
//  Created by serge 徐 on 16/6/27.
//  Copyright © 2016年 serge xu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"

@interface ViewController ()

@property (nonatomic , strong) UILabel * titleLabel;

@property (nonatomic , strong) UIButton * eqBtn;

@property (nonatomic , strong) UIButton * addBtn;

@property (nonatomic , strong) UIButton * subrctBtn;

@property (nonatomic , strong) UIButton * multBtn;

@property (nonatomic , strong) UIButton * divBtn;

@property (nonatomic , strong) UIButton * btn1;
@property (nonatomic , strong) UIButton * btn2;
@property (nonatomic , strong) UIButton * btn3;
@property (nonatomic , strong) UIButton * btn4;
@property (nonatomic , strong) UIButton * btn5;
@property (nonatomic , strong) UIButton * btn6;
@property (nonatomic , strong) UIButton * btn7;
@property (nonatomic , strong) UIButton * btn8;
@property (nonatomic , strong) UIButton * btn9;

@property (nonatomic , strong) UIButton * btn0;

@property (nonatomic , strong) UIButton * btnDot;

@property (nonatomic , strong) UIButton * btnClear;
@property (nonatomic , strong) UIButton * btnMinus;
@property (nonatomic , strong) UIButton * btnRemain;

@property (nonatomic , strong) UILabel * resultLabel;

@property (nonatomic, assign ) double arg1;
@property (nonatomic, assign ) double arg2;
@property (nonatomic, assign ) double result;
@property (nonatomic, assign ) int cal;//(nil + - x / %, 0,1,2,3,4,5)

-(double) calculatWithSign:(int)cal Arg1:(double)arg1 Arg2:(double)arg2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor blackColor]];
    //need to add to super view first
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.eqBtn];
    [self.view addSubview:self.addBtn];
    [self.view addSubview:self.subrctBtn];
    [self.view addSubview:self.multBtn];
    [self.view addSubview:self.divBtn];
    
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    [self.view addSubview:self.btn3];
    [self.view addSubview:self.btn4];
    [self.view addSubview:self.btn5];
    [self.view addSubview:self.btn6];
    [self.view addSubview:self.btn7];
    [self.view addSubview:self.btn8];
    [self.view addSubview:self.btn9];
    [self.view addSubview:self.btn0];
    [self.view addSubview:self.btnDot];
    
    [self.view addSubview:self.btnClear];
    [self.view addSubview:self.btnMinus];
    [self.view addSubview:self.btnRemain];
    
    [self.view addSubview:self.resultLabel];
    
    
    CGSize deviceScreenSize= [UIScreen mainScreen].bounds.size;
    
    WEAK_SELF(weakSelf);
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(18);
        make.left.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@20);
    }];
    [self.eqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.height.equalTo(@(deviceScreenSize.width/4));
        make.width.equalTo(@(deviceScreenSize.width/4));
    }];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.eqBtn.mas_top);
        make.right.equalTo(weakSelf.eqBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.subrctBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.addBtn.mas_top);
        make.right.equalTo(weakSelf.eqBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.multBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.subrctBtn.mas_top);
        make.right.equalTo(weakSelf.eqBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.divBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.multBtn.mas_top);
        make.right.equalTo(weakSelf.eqBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.addBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn1.mas_right);
        make.top.equalTo(weakSelf.addBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn2.mas_right);
        make.top.equalTo(weakSelf.addBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.subrctBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn4.mas_right);
        make.top.equalTo(weakSelf.subrctBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn5.mas_right);
        make.top.equalTo(weakSelf.subrctBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.multBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn7.mas_right);
        make.top.equalTo(weakSelf.multBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn9 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn8.mas_right);
        make.top.equalTo(weakSelf.multBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.eqBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn).multipliedBy(2);
    }];
    [self.btnDot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btn0.mas_right);
        make.top.equalTo(weakSelf.eqBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btnClear mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(weakSelf.view);
         make.top.equalTo(weakSelf.divBtn);
         make.height.equalTo(weakSelf.eqBtn);
         make.width.equalTo(weakSelf.eqBtn);
     }];
    [self.btnMinus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btnClear.mas_right);
        make.top.equalTo(weakSelf.divBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.btnRemain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btnMinus.mas_right);
        make.top.equalTo(weakSelf.divBtn);
        make.height.equalTo(weakSelf.eqBtn);
        make.width.equalTo(weakSelf.eqBtn);
    }];
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(30);
        make.width.equalTo(weakSelf.view);
        make.centerX.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.btnClear.mas_top);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//pargma mark - lazy load
- (UILabel *)titleLabel
{
    if(!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        
    }
    _titleLabel.text = @"Simple Calculator";
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.backgroundColor = [UIColor blueColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    return _titleLabel;
}
- (UILabel *)resultLabel
{
    if(!_resultLabel)
    {
        _resultLabel = [[UILabel alloc]init];
        
    }
    _resultLabel.text = @"0";
    _resultLabel.font = [UIFont systemFontOfSize:70];
    [_resultLabel setTextColor:[UIColor whiteColor]];
    _resultLabel.backgroundColor = [UIColor blackColor];
    _resultLabel.textAlignment = NSTextAlignmentRight;
    return _resultLabel;
}

-(UIButton *)eqBtn
{
    if(!_eqBtn)
    {
        _eqBtn = [[UIButton alloc]init];
        
    }
    [_eqBtn setTitle:@"=" forState:UIControlStateNormal];
    _eqBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    _eqBtn.backgroundColor = [UIColor redColor];
    _eqBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_eqBtn.layer setBorderWidth:1.0];
    [_eqBtn addTarget:self  action:@selector(btnEqClick:) forControlEvents:UIControlEventTouchUpInside];
    return _eqBtn;

}
-(UIButton *)addBtn
{
    if(!_addBtn)
    {
        _addBtn = [[UIButton alloc]init];
        
    }
    [_addBtn setTitle:@"+" forState:UIControlStateNormal];
    _addBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    _addBtn.backgroundColor = [UIColor redColor];
    _addBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_addBtn.layer setBorderWidth:1.0];
    [_addBtn addTarget:self  action:@selector(btnAddClick:) forControlEvents:UIControlEventTouchUpInside];
    return _addBtn;
    
}
-(UIButton *)subrctBtn
{
    if(!_subrctBtn)
    {
        _subrctBtn = [[UIButton alloc]init];
        
    }
    [_subrctBtn setTitle:@"-" forState:UIControlStateNormal];
    _subrctBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    _subrctBtn.backgroundColor = [UIColor redColor];
    _subrctBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_subrctBtn.layer setBorderWidth:1.0];
    [_subrctBtn addTarget:self  action:@selector(btnSubClick:) forControlEvents:UIControlEventTouchUpInside];
    return _subrctBtn;
    
}
-(UIButton *)multBtn
{
    if(!_multBtn)
    {
        _multBtn = [[UIButton alloc]init];
        
    }
    [_multBtn setTitle:@"x" forState:UIControlStateNormal];
    _multBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    _multBtn.backgroundColor = [UIColor redColor];
    _multBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_multBtn.layer setBorderWidth:1.0];
    [_multBtn addTarget:self  action:@selector(btnMulClick:) forControlEvents:UIControlEventTouchUpInside];
    return _multBtn;
    
}
-(UIButton *)divBtn
{
    if(!_divBtn)
    {
        _divBtn = [[UIButton alloc]init];
        
    }
    [_divBtn setTitle:@"/" forState:UIControlStateNormal];
    _divBtn.titleLabel.font = [UIFont systemFontOfSize:40];
    _divBtn.backgroundColor = [UIColor redColor];
    _divBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_divBtn.layer setBorderWidth:1.0];
    [_divBtn addTarget:self  action:@selector(btnDivClick:) forControlEvents:UIControlEventTouchUpInside];
    return _divBtn;
    
}
-(UIButton *)btn1
{
    if(!_btn1)
    {
        _btn1 = [[UIButton alloc]init];
        
    }
    
    _btn1.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn1 setTitle:@"1" forState:UIControlStateNormal];
    _btn1.backgroundColor = [UIColor whiteColor];
    _btn1.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn1.layer setBorderWidth:1.0];
    [_btn1 addTarget:self  action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn1;
    
}
-(UIButton *)btn2
{
    if(!_btn2)
    {
        _btn2 = [[UIButton alloc]init];
        
    }
    
    _btn2.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn2 setTitle:@"2" forState:UIControlStateNormal];
    _btn2.backgroundColor = [UIColor whiteColor];
    _btn2.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn2.layer setBorderWidth:1.0];
    [_btn2 addTarget:self  action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn2;
    
}
-(UIButton *)btn3
{
    if(!_btn3)
    {
        _btn3 = [[UIButton alloc]init];
        
    }
    
    _btn3.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn3 setTitle:@"3" forState:UIControlStateNormal];
    _btn3.backgroundColor = [UIColor whiteColor];
    _btn3.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn3.layer setBorderWidth:1.0];
    [_btn3 addTarget:self  action:@selector(btn3Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn3;
    
}
-(UIButton *)btn4
{
    if(!_btn4)
    {
        _btn4 = [[UIButton alloc]init];
        
    }
    
    _btn4.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn4 setTitle:@"4" forState:UIControlStateNormal];
    _btn4.backgroundColor = [UIColor whiteColor];
    _btn4.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn4.layer setBorderWidth:1.0];
    [_btn4 addTarget:self  action:@selector(btn4Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn4;
    
}
-(UIButton *)btn5
{
    if(!_btn5)
    {
        _btn5 = [[UIButton alloc]init];
        
    }
    
    _btn5.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn5 setTitle:@"5" forState:UIControlStateNormal];
    _btn5.backgroundColor = [UIColor whiteColor];
    _btn5.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn5.layer setBorderWidth:1.0];
    [_btn5 addTarget:self  action:@selector(btn5Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn5;
    
}
-(UIButton *)btn6
{
    if(!_btn6)
    {
        _btn6 = [[UIButton alloc]init];
        
    }
    
    _btn6.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn6 setTitle:@"6" forState:UIControlStateNormal];
    _btn6.backgroundColor = [UIColor whiteColor];
    _btn6.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn6.layer setBorderWidth:1.0];
    [_btn6 addTarget:self  action:@selector(btn6Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn6;
    
}
-(UIButton *)btn7
{
    if(!_btn7)
    {
        _btn7 = [[UIButton alloc]init];
        
    }
    
    _btn7.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn7 setTitle:@"7" forState:UIControlStateNormal];
    _btn7.backgroundColor = [UIColor whiteColor];
    _btn7.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn7.layer setBorderWidth:1.0];
    [_btn7 addTarget:self  action:@selector(btn7Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn7;
    
}
-(UIButton *)btn8
{
    if(!_btn8)
    {
        _btn8 = [[UIButton alloc]init];
        
    }
    
    _btn8.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn8 setTitle:@"8" forState:UIControlStateNormal];
    _btn8.backgroundColor = [UIColor whiteColor];
    _btn8.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn8.layer setBorderWidth:1.0];
    [_btn8 addTarget:self  action:@selector(btn8Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn8;
    
}
-(UIButton *)btn9
{
    if(!_btn9)
    {
        _btn9 = [[UIButton alloc]init];
        
    }
    
    _btn9.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn9 setTitle:@"9" forState:UIControlStateNormal];
    _btn9.backgroundColor = [UIColor whiteColor];
    _btn9.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn9.layer setBorderWidth:1.0];
    [_btn9 addTarget:self  action:@selector(btn9Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn9;
    
}
-(UIButton *)btn0
{
    if(!_btn0)
    {
        _btn0 = [[UIButton alloc]init];
        
    }
    
    _btn0.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btn0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn0 setTitle:@"0" forState:UIControlStateNormal];
    _btn0.backgroundColor = [UIColor whiteColor];
    _btn0.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btn0.layer setBorderWidth:1.0];
    [_btn0 addTarget:self  action:@selector(btn0Click:) forControlEvents:UIControlEventTouchUpInside];
    return _btn0;
    
}
-(UIButton *)btnDot
{
    if(!_btnDot)
    {
        _btnDot = [[UIButton alloc]init];
        
    }
    
    _btnDot.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btnDot setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnDot setTitle:@"." forState:UIControlStateNormal];
    _btnDot.backgroundColor = [UIColor whiteColor];
    _btnDot.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btnDot.layer setBorderWidth:1.0];
    return _btnDot;
    
}
-(UIButton *)btnClear
{
    if(!_btnClear)
    {
        _btnClear = [[UIButton alloc]init];
        
    }
    
    _btnClear.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btnClear setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnClear setTitle:@"AC" forState:UIControlStateNormal];
    _btnClear.backgroundColor = [UIColor lightGrayColor];
    _btnClear.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btnClear.layer setBorderWidth:1.0];
    [_btnClear addTarget:self  action:@selector(btnCleanClick:) forControlEvents:UIControlEventTouchUpInside];
    return _btnClear;
    
}
-(UIButton *)btnMinus
{
    if(!_btnMinus)
    {
        _btnMinus = [[UIButton alloc]init];
        
    }
    
    _btnMinus.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btnMinus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnMinus setTitle:@"+/-" forState:UIControlStateNormal];
    _btnMinus.backgroundColor = [UIColor lightGrayColor];
    _btnMinus.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btnMinus.layer setBorderWidth:1.0];
    [_btnMinus addTarget:self  action:@selector(btnMinClick:) forControlEvents:UIControlEventTouchUpInside];
    return _btnMinus;
    
}
-(UIButton *)btnRemain
{
    if(!_btnRemain)
    {
        _btnRemain = [[UIButton alloc]init];
        
    }
    
    _btnRemain.titleLabel.font = [UIFont systemFontOfSize:40];
    [_btnRemain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnRemain setTitle:@"%" forState:UIControlStateNormal];
    _btnRemain.backgroundColor = [UIColor lightGrayColor];
    _btnRemain.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_btnRemain.layer setBorderWidth:1.0];
    [_btnRemain addTarget:self  action:@selector(btnRemClick:) forControlEvents:UIControlEventTouchUpInside];
    return _btnRemain;
    
}
-(double) calculatWithSign:(int) cal Arg1:(double) arg1 Arg2:(double) arg2
{
    if(cal == 1)
        return (double)(arg1+arg2);
    else if(cal==2)
        return (double)(arg1-arg2);
    else if(cal==3)
        return (double)(arg1*arg2);
    else if(cal==4)
        return (double)(arg1/arg2);
    else if(cal==5)
        return (double)((int)arg1%(int)arg2);
    else{
        NSLog(@"运算符无效 为%d",cal);
        return 0;
    }
}
#pragma mark - 按钮事件
- (void)btn1Click:(UIButton *)sender{
    NSLog(@"BTN 1 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +1;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +1;
        [self showArg2];
    }
}
- (void)btn2Click:(UIButton *)sender{
    NSLog(@"BTN 2 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +2;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +2;
        [self showArg2];
    }
}
- (void)btn3Click:(UIButton *)sender{
    NSLog(@"BTN 3 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +3;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +3;
        [self showArg2];
    }
}
- (void)btn4Click:(UIButton *)sender{
    NSLog(@"BTN 4 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +4;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +4;
        [self showArg2];
    }
}
- (void)btn5Click:(UIButton *)sender{
    NSLog(@"BTN 5 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +5;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +5;
        [self showArg2];
    }
}
- (void)btn6Click:(UIButton *)sender{
    NSLog(@"BTN 6 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +6;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +6;
        [self showArg2];
    }
}
- (void)btn7Click:(UIButton *)sender{
    NSLog(@"BTN 7 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +7;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +7;
        [self showArg2];
    }
}
- (void)btn8Click:(UIButton *)sender{
    NSLog(@"BTN 8 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +8;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +8;
        [self showArg2];
    }
}
- (void)btn9Click:(UIButton *)sender{
    NSLog(@"BTN 9 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 +9;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 +9;
        [self showArg2];
    }
}
- (void)btn0Click:(UIButton *)sender{
    NSLog(@"BTN 0 clicked");
    if(self.cal==0)
    {
        self.arg1 = 10 * self.arg1 ;
        [self showArg1];
    }
    else
    {
        self.arg2 = 10 * self.arg2 ;
         [self showArg2];
    }
}
- (void)btnEqClick:(UIButton *)sender{
    NSLog(@"eq + clicked");
    if(self.cal==0)
    {
    }
    else if(self.cal==4 && self.arg2 ==0)
    {
        [self.resultLabel setText:[NSString stringWithFormat:@"错误"]];
    }
    else
    {
        self.result = [self calculatWithSign:self.cal Arg1:self.arg1 Arg2:self.arg2];
        [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
        [self clean];
        
    }
}
- (void)btnAddClick:(UIButton *)sender{
    NSLog(@"add + clicked");
    //first time
    if(self.cal==0)
    {
        self.cal = 1;
        [self showArg2];
    }
    else
    {
        if(self.cal==4 && self.arg2 ==0)
        {
            [self.resultLabel setText:[NSString stringWithFormat:@"错误"]];
        }
        else
        {
            self.result = [self calculatWithSign:self.cal Arg1:self.arg1 Arg2:self.arg2];
            [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
            self.arg1 =self.result;
            self.cal=1;
            self.arg2 = 0;
            self.result = 0;
        }

    }
}
- (void)btnSubClick:(UIButton *)sender{
    NSLog(@"add2 + clicked");
    //first time
    if(self.cal==0)
    {
        self.cal = 2;
        [self showArg2];
    }
    else
    {
        if(self.cal==4 && self.arg2 ==0)
        {
            [self.resultLabel setText:[NSString stringWithFormat:@"错误"]];
        }
        else
        {
            self.result = [self calculatWithSign:self.cal Arg1:self.arg1 Arg2:self.arg2];
            [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
            self.arg1 =self.result;
            self.cal=2;
            self.arg2 = 0;
            self.result = 0;
        }
        
    }

}
- (void)btnMulClick:(UIButton *)sender{
    NSLog(@"add3 + clicked");
    //first time
    if(self.cal==0)
    {
        self.cal = 3;
        [self showArg2];
    }
    else
    {
        if(self.cal==4 && self.arg2 ==0)
        {
            [self.resultLabel setText:[NSString stringWithFormat:@"错误"]];
        }
        else
        {
            self.result = [self calculatWithSign:self.cal Arg1:self.arg1 Arg2:self.arg2];
            [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
            self.arg1 =self.result;
            self.cal=3;
            self.arg2 = 0;
            self.result = 0;
        }
        
    }

}
- (void)btnDivClick:(UIButton *)sender{
    NSLog(@"add4 + clicked");
    //first time
    if(self.cal==0)
    {
        self.cal = 4;
        [self showArg2];
    }
    else
    {
        if(self.cal==4 && self.arg2 ==0)
        {
            [self.resultLabel setText:[NSString stringWithFormat:@"错误"]];
        }
        else
        {
            self.result = [self calculatWithSign:self.cal Arg1:self.arg1 Arg2:self.arg2];
            [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
            self.arg1 =self.result;
            self.cal=4;
            self.arg2 = 0;
            self.result = 0;
        }
        
    }

}
- (void)btnCleanClick:(UIButton *)sender{
    [self clean];
    [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
}
- (void)btnMinClick:(UIButton *)sender{
    if(self.cal==0)
    {
        self.arg1 = -1 * self.arg1 ;
        [self showArg1];
    }
    else
    {
        self.arg2 = -1 * self.arg2 ;
        [self showArg2];
    }
}
- (void)btnRemClick:(UIButton *)sender{
    //first time
    if(self.cal==0)
    {
        self.cal = 5;
        [self showArg2];
    }
    else
    {
        if(self.cal==4 && self.arg2 ==0)
        {
            [self.resultLabel setText:[NSString stringWithFormat:@"错误"]];
        }
        else
        {
            self.result = [self calculatWithSign:self.cal Arg1:self.arg1 Arg2:self.arg2];
            [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.result ]];
            self.arg1 =self.result;
            self.cal=5;
            self.arg2 = 0;
            self.result = 0;
        }
        
    }

}
-(void) clean
{
    self.arg1=0;
    self.arg2= 0;
    self.cal = 0;
    self.result = 0;
}
-(void)showArg1
{
    [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.arg1 ]];
}
-(void)showArg2
{
    [self.resultLabel setText:[NSString stringWithFormat:@"%.2f",self.arg2 ]];
}
@end
