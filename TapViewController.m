//
//  TapViewController.m
//  Gestures
//
//  Created by Rushan on 2017-05-11.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    [view addGestureRecognizer:tapGesture];
    

}

-(void)viewTapped:(UITapGestureRecognizer *)tapGesture{
   // CGPoint location = [tapGesture locationInView:self.view];
   // UIColor *otherColor;
    //UIColor *someColor;
    
    UIColor *oldColor = tapGesture.view.backgroundColor;
    UIColor *newColor = [oldColor isEqual: [UIColor purpleColor]] ? [UIColor orangeColor] : [UIColor purpleColor];
    tapGesture.view.backgroundColor = newColor;
    
    //if((tapGesture.state == UIGestureRecognizerStateBegan || tapGesture.state == UIGestureRecognizerStateChanged))
        
    

}

@end
