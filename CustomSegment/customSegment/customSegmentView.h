//
//  customSegmentView.h
//  CustomSegment
//
//  Created by taitanxiami on 15/6/1.
//  Copyright (c) 2015年 taitanxiami. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  代理方法
 */
@protocol selectedBtnDelegate <NSObject>

-(void)didSelectedButton:(NSInteger)senderNum;


@end

@interface customSegmentView : UIView
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor *selectedColor;
@property (nonatomic) BOOL isDefaultSelected;
@property (nonatomic,strong) UIColor *bottomViewColor;
@property (nonatomic,strong) NSMutableArray *buttons;

@property (nonatomic,assign) id<selectedBtnDelegate>delegate;

//@property (nonatomic,strong) UIView *bottomView;
//@property (nonatomic)NSInteger btnNum;
@property (nonatomic) NSInteger selectedIndex;
-(void)setTitles:(NSArray *)titlesArr withNum:(NSInteger)btnNum;

@end
