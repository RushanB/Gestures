//
//  PanViewController.m
//  Gestures
//
//  Created by Rushan on 2017-05-11.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController
- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender {
    //CGPoint locationInView = [sender locationInView:self.view];
    //sender.view.center = locationInView;
    CGPoint translationInView = [sender translationInView:self.view];
    CGPoint oldCenter = sender.view.center;
    CGPoint newCenter = CGPointMake(oldCenter.x + translationInView.x, oldCenter.y + translationInView.y);
    sender.view.center = newCenter;
    [sender setTranslation:CGPointZero inView:self.view];
    
}




@end