//
//  customSegmentView.m
//  CustomSegment
//
//  Created by taitanxiami on 15/6/1.
//  Copyright (c) 2015年 taitanxiami. All rights reserved.
//

#import "customSegmentView.h"

@interface customSegmentView ()

@property (nonatomic) BOOL isSelected;  //按钮选中

@end


@implementation customSegmentView

-(void)setTitles:(NSArray *)titlesArr withNum:(NSInteger)btnNum
{
    _isSelected = YES;
    
    self.backgroundColor = [UIColor colorWithRed:0.337 green:0.320 blue:0.301 alpha:1.000];
    
    double btnWidth = self.frame.size.width / btnNum;
    double btnHeight = self.frame.size.height;
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 46, btnWidth, 4)];
    bottomView.tag = 110;
    bottomView.backgroundColor = _bottomViewColor;
    [self addSubview:bottomView];
    
    
    float deltaX = 0;
    for (NSInteger i = 0; i < btnNum; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        if (i == 0 ) {
            
            [btn setTitleColor:_bottomViewColor forState:UIControlStateNormal];
            
        }else
        {
            [btn setTitleColor:[UIColor colorWithRed:1.000 green:0.973 blue:0.982 alpha:1.000] forState:UIControlStateNormal];
            
        }
        
        
        btn.frame = CGRectMake(0 + deltaX, 0 , btnWidth, btnHeight - 4);
        [btn setTitle:titlesArr[i] forState:UIControlStateNormal];
        
        btn.tag = 100 + i;
        
        
        [btn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        deltaX += btnWidth;
        
        [self addSubview:btn];
    }
}

-(void)selectBtn:(UIButton *)sender
{
    
    UIButton *currentBtn = (UIButton *)sender;
    
    if ( [self respondsToSelector:@selector(didSelectedButton:)]) {
        
        [self.delegate didSelectedButton:currentBtn.tag - 100];
    }
    
    
    self.selectedIndex = currentBtn.tag - 100;
    UIView *selectedView = [self viewWithTag:110];
    [UIView beginAnimations:nil context:nil];
    CGRect newFrame = selectedView.frame;
    newFrame.origin.x = sender.frame.origin.x;
    selectedView.frame = newFrame;
    [UIView commitAnimations];
    [sender setTitleColor:_bottomViewColor forState:UIControlStateNormal];
    
    for (UIButton *btn in self.subviews) {
        
        if (btn.tag != currentBtn.tag && [btn isKindOfClass:[UIButton class]]) {
            
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
