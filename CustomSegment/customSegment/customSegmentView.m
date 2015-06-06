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
@property (nonatomic,strong) NSMutableArray *btnTitleWidthArr;

@end


@implementation customSegmentView

-(void)setTitles:(NSArray *)titlesArr withNum:(NSInteger)btnNum
{
    _isSelected = YES;
    
    self.backgroundColor = [UIColor colorWithRed:0.337 green:0.320 blue:0.301 alpha:1.000];
    
    double btnWidth = self.frame.size.width / btnNum;
    double btnHeight = self.frame.size.height;
    
    
    _btnTitleWidthArr  =[NSMutableArray arrayWithCapacity:3];
    float deltaX = 0;
    for (NSInteger i = 0; i < btnNum; i++) {
        
         UIButton *btn = [[UIButton alloc]initWithFrame: CGRectMake(0 + deltaX, 0 , btnWidth, btnHeight)];
        if (i == 0 ) {
            
            [btn setTitleColor:_bottomViewColor forState:UIControlStateNormal];
            
        }else
        {
            [btn setTitleColor:_titleColor forState:UIControlStateNormal];
            
        }
        [btn setTitle:titlesArr[i] forState:UIControlStateNormal];

        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [self calculateTextWidthWithString:titlesArr[i] fontSize:14.0f];
        
        btn.tag = 100 + i;
        
        
        [btn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        deltaX += btnWidth;
        
        [self addSubview:btn];
    }
    
    //bottom view
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake((btnWidth - [_btnTitleWidthArr[0] floatValue]) / 2, btnHeight - 2, [_btnTitleWidthArr[0] floatValue], 2)];
    NSLog(@"%@",NSStringFromCGRect(bottomView.frame));
    bottomView.tag = 110;
    bottomView.backgroundColor = _bottomViewColor;
    [self addSubview:bottomView];

}

-(void)selectBtn:(UIButton *)sender
{
    
    UIButton *currentBtn = (UIButton *)sender;
    [currentBtn setTitleColor:_bottomViewColor forState:UIControlStateNormal];
    if ( [self respondsToSelector:@selector(didSelectedButton:)]) {
        
        [self.delegate didSelectedButton:currentBtn.tag - 100];
    }
    
    self.selectedIndex = currentBtn.tag - 100;
    
    UIView *selectedView = [self viewWithTag:110];
    [UIView beginAnimations:nil context:nil];
    
    CGRect newFrame = selectedView.frame;
    newFrame.size.width = [_btnTitleWidthArr[self.selectedIndex] floatValue];
    selectedView.frame = newFrame;
    
    CGPoint centerPoint = selectedView.center;
    centerPoint.x = sender.center.x;
    centerPoint.y =  43;
    selectedView.center = centerPoint;
    [UIView commitAnimations];
    
    

    
    for (UIButton *btn in self.subviews) {
        
        if (btn.tag != currentBtn.tag && [btn isKindOfClass:[UIButton class]]) {
            
            [btn setTitleColor:_titleColor forState:UIControlStateNormal];
        }
    }
}
#pragma mark - calculate text width
-(void)calculateTextWidthWithString:(NSString *)text fontSize:(CGFloat)fontSize
{
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSDictionary *userAttributes = @{NSFontAttributeName: font,
                                     NSForegroundColorAttributeName: [UIColor blackColor]};
    
    
    CGFloat width  =  [text sizeWithAttributes: userAttributes].width;
    [_btnTitleWidthArr addObject:[NSNumber numberWithFloat:width]];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
