//
//  CustomPushAnimation.m
//  SeguePrac
//
//  Created by Realank-Mac on 16/1/16.
//  Copyright © 2016年 Realank-Mac. All rights reserved.
//

#import "CustomPushAnimation.h"

@implementation CustomPushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIView* shadowBack = [[UIView alloc]initWithFrame:window.bounds];
    shadowBack.backgroundColor = [UIColor blackColor];
    shadowBack.alpha = 0.7;
    [window addSubview:shadowBack];
    
    UIView* frontWhiteView = [[UIView alloc]initWithFrame:CGRectMake(0, screenHeight/2-20, screenWidth, 40)];
    frontWhiteView.backgroundColor = [UIColor whiteColor];
    [window addSubview:frontWhiteView];
    
    //添加toView到上下文
    [[transitionContext containerView] insertSubview:toViewController.view aboveSubview:fromViewController.view];

    
    //自定义动画
    
    toViewController.view.frame = CGRectMake(0, 0, screenWidth , screenHeight);
    toViewController.view.hidden = YES;
    
//    toViewController.view.transform = CGAffineTransformMakeTranslation(screenWidth, screenHeight);
    
    NSTimeInterval timeInterval = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:timeInterval/5 animations:^{
        frontWhiteView.frame = CGRectMake(0, screenHeight/2-18, screenWidth, 36);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:4*timeInterval/5 animations:^{
            frontWhiteView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        } completion:^(BOOL finished) {
            [shadowBack removeFromSuperview];
            [frontWhiteView removeFromSuperview];
        }];
    }];
    [UIView animateWithDuration:timeInterval animations:^{
        
        fromViewController.navigationController.view.transform = CGAffineTransformMakeScale(0.8, 0.8);//CGAffineTransformMakeTranslation(-screenWidth, -screenHeight );
        
//        toViewController.view.transform = CGAffineTransformMakeTranslation(0, 0);
        
        
    } completion:^(BOOL finished) {
//        fromViewController.navigationController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
        fromViewController.navigationController.view.transform = CGAffineTransformIdentity;
        toViewController.view.hidden = NO;
        // 声明过渡结束时调用 completeTransition: 这个方法
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
