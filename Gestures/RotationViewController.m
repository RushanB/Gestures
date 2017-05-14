


//
//  RotationViewController.m
//  Gestures
//
//  Created by Rushan on 2017-05-13.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController()


@end


@implementation RotationViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-100/2, CGRectGetMidY(self.view.bounds)-100/2, 100, 100)]; //make box
    view.backgroundColor = [UIColor redColor];
    
    UIRotationGestureRecognizer *rotationGest = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationGesture:)];
    
    [self.view addSubview:view];
    [view addGestureRecognizer:rotationGest]; //put to gesture to view
}

-(IBAction)rotationGesture:(UIRotationGestureRecognizer *)sender{
    [sender.view setTransform:CGAffineTransformMakeRotation(sender.rotation)];
}

@end
