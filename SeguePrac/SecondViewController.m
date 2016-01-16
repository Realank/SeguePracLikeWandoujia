//
//  SecondViewController.m
//  SeguePrac
//
//  Created by Realank-Mac on 16/1/16.
//  Copyright © 2016年 Realank-Mac. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"VC2";
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(dismissSelf)];
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setLeftBarButtonItem:item];
    
//
}

- (void)dismissSelf {
    
    
    if (self.previousNav) {
        self.previousNav.view.transform = CGAffineTransformMakeScale(0.85, 0.85);
        [UIView animateWithDuration:0.5 animations:^{
            self.previousNav.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}



@end
