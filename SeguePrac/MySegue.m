//
//  MySegue.m
//  SeguePrac
//
//  Created by Realank-Mac on 16/1/16.
//  Copyright © 2016年 Realank-Mac. All rights reserved.
//

#import "MySegue.h"

@implementation MySegue

- (void)perform {
    UIView *prevView = self.sourceViewController.view;
    UIView *nextView = self.destinationViewController.view;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    nextView.frame = CGRectMake(screenWidth, 0, screenWidth, screenHeight);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window insertSubview:nextView aboveSubview:prevView];
    
    [UIView animateWithDuration:0.5 animations:^{
        prevView.frame = CGRectOffset(prevView.frame, -screenWidth, 0);
        nextView.frame = CGRectOffset(nextView.frame, -screenWidth, 0);
    } completion:^(BOOL finished) {
        [self.sourceViewController.navigationController pushViewController:self.destinationViewController animated:NO];
    }];
    
}

@end
