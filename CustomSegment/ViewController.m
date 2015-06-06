//
//  ViewController.m
//  CustomSegment
//
//  Created by taitanxiami on 15/6/1.
//  Copyright (c) 2015年 taitanxiami. All rights reserved.
//

#import "ViewController.h"
#import "customSegmentView.h"
@interface ViewController ()<selectedBtnDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    customSegmentView *btnView = [[customSegmentView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 44)];
    btnView.titleColor = [UIColor whiteColor];
    btnView.delegate = self;
    btnView.isDefaultSelected = NO;
    btnView.bottomViewColor = [UIColor redColor];
    
    [btnView setTitles:@[@"综合",@"排序哦",@"新浪微博",@"体育"] withNum:4];
    [self.view addSubview:btnView];

}

#pragma mark - ButtonView delegate
-(void)didSelectedButton:(NSInteger )index
{
    
    NSLog(@"sender index = %ld",index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
