//
//  ViewController.m
//  iAmRick
//
//  Created by Tin Blanc on 3/10/16.
//  Copyright © 2016 Tin Blanc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ruby;
@property (weak, nonatomic) IBOutlet UILabel *iAmRick;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ruby.alpha = 0;
    self.iAmRick.alpha = 0;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"ruby's alpha = %1.0f", self.ruby.alpha);
    [UIView animateWithDuration:4 animations:^{
        self.ruby.alpha = 1;
        NSLog(@"ruby's alpha = %1.0f", self.ruby.alpha);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            self.iAmRick.center = CGPointMake(self.iAmRick.center.x, 360);
            self.iAmRick.alpha = 1;
            
        } completion:nil];
    }];
}


@end
