//
//  SwipeViewController.m
//  Gestures
//
//  Created by Rushan on 2017-05-11.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic) BOOL isSwipe;

@end

//bottom view add to self.view
//add white view to bottom view, the brown view
//make white view coords relative to brown view
//set clips to bounds on brown view..when change center point of white view it clips to bounds
//two different gestures to swipe right and left
//give them the same selector method, check parameter for direction of swipe
    //sender.direction
   // check for direction

@implementation SwipeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isSwipe = NO;
    
    UIView *brownView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds)-self.view.bounds.size.width/2+15,CGRectGetMidY(self.view.bounds)-50/2 ,self.view.bounds.size.width-30,50)];  //brown frame
    brownView.backgroundColor = [UIColor brownColor];
    brownView.clipsToBounds = YES;
    [self.view addSubview:brownView];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0,0, brownView.frame.size.width, brownView.frame.size.height)]; //white frame
    whiteView.backgroundColor = [UIColor whiteColor];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer* rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [whiteView addGestureRecognizer:leftSwipe];
    [whiteView addGestureRecognizer:rightSwipe];
    
    [brownView addSubview:whiteView];  //adds white bar to brown bar
    [brownView bringSubviewToFront:whiteView];

}

-(IBAction)swipeGesture:(UISwipeGestureRecognizer *)sender{
    //NSLog(@"Swipe Gesture");
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft){ //animations
        [UIView animateWithDuration:0.7
                         animations:^{sender.view.frame = CGRectMake(sender.view.frame.origin.x -120, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}
                         completion:^(BOOL finished){
                             [UIView animateWithDuration:0.2 animations:^{
                                 sender.view.frame = CGRectMake(sender.view.frame.origin.x + 20,sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height); }];
                         }];
    }else{         [UIView animateWithDuration:0.7
                                    animations:^{sender.view.frame = CGRectMake(sender.view.frame.origin.x + 120, sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height);}
                                    completion:^(BOOL finished){
                                        [UIView animateWithDuration:0.2 animations:^{
                                            sender.view.frame = CGRectMake(sender.view.frame.origin.x - 20,sender.view.frame.origin.y, sender.view.frame.size.width, sender.view.frame.size.height); }];
                                    }];
    }
    
}
@end
