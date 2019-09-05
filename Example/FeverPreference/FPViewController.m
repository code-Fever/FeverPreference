//
//  FPViewController.m
//  FeverPreference
//
//  Created by Fever on 09/04/2019.
//  Copyright (c) 2019 Fever. All rights reserved.
//

#import "FPViewController.h"
#import "FPCacheModel.h"
#define UI_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define colorsred         (ColorWithRGBA(0xff, 0x48, 0x91, 1.0))
#define ColorWithRGBA(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)])

@interface FPViewController ()
@property (nonatomic, strong) FPCacheModel *cacheModel;
@end

@implementation FPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cacheModel = [[FPCacheModel alloc]init];
    
    UIButton *stringBtn = [[UIButton alloc]init];
    [stringBtn setBackgroundColor:colorsred];
    stringBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    if (self.cacheModel.feverString) {
        [stringBtn setTitle:self.cacheModel.feverString forState:UIControlStateNormal];
    }
    stringBtn.frame = CGRectMake(0, 50, UI_SCREEN_WIDTH, 44);
    [self.view addSubview:stringBtn];
    [stringBtn addTarget:self action:@selector(changeSSS:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *intBtn = [[UIButton alloc]init];
    [intBtn setBackgroundColor:colorsred];
    intBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    if (self.cacheModel.feverInteger) {
        [intBtn setTitle:[NSString stringWithFormat:@"feverInteger已成功存入NSUserDefaults:%li",(long)self.cacheModel.feverInteger] forState:UIControlStateNormal];
    }
    intBtn.frame = CGRectMake(0, CGRectGetMaxY(stringBtn.frame) + 20, UI_SCREEN_WIDTH, 44);
    [self.view addSubview:intBtn];
    [intBtn addTarget:self action:@selector(changeIII:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *dictBtn = [[UIButton alloc]init];
    [dictBtn setBackgroundColor:colorsred];
    dictBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    if (self.cacheModel.feverDict) {
        [dictBtn setTitle:[NSString stringWithFormat:@"%@",self.cacheModel.feverDict[@"fever"]] forState:UIControlStateNormal];
    }
    dictBtn.frame = CGRectMake(0, CGRectGetMaxY(intBtn.frame) + 20, UI_SCREEN_WIDTH, 44);
    [self.view addSubview:dictBtn];
    [dictBtn addTarget:self action:@selector(changeDDD:) forControlEvents:UIControlEventTouchUpInside];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)changeSSS:(UIButton *)sender {
    self.cacheModel.feverString = @"feverString已经成功被MMKV存储";
    if(!sender.titleLabel.text) {
        [sender setTitle:@"重新启动即展示 feverString" forState:UIControlStateNormal];
    }
}

- (void)changeIII:(UIButton *)sender {
    self.cacheModel.feverInteger = 998833447;
    if(!sender.titleLabel.text) {
        [sender setTitle:@"重新启动即展示 feverInteger" forState:UIControlStateNormal];
    }
}

- (void)changeDDD:(UIButton *)sender {
    self.cacheModel.feverDict = @{@"fever":@"feverDict已经成功被MMKV存储"};
    if(!sender.titleLabel.text) {
        [sender setTitle:@"重新启动即展示 feverInteger" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
