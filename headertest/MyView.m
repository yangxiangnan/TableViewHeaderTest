//
//  MyView.m
//  headertest
//
//  Created by yxn on 16/7/23.
//  Copyright © 2016年 yxn. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *result = [super hitTest:point withEvent:event];
    if (result == self) {
        return nil;
    } else {
        return result;
    }
}


@end
