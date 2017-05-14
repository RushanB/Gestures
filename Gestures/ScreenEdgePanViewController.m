//
//  ScreenEdgePanViewController.m
//  Gestures
//
//  Created by Rushan on 2017-05-13.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "ScreenEdgePanViewController.h"

@interface ScreenEdgePanViewController()

@property (nonatomic) BOOL isShowing;
@property (nonatomic) UIPanGestureRecognizer *pan;
@property (nonatomic) UIScreenEdgePanGestureRecognizer *screenEdge;

@end


@implementation ScreenEdgePanViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.isShowing = NO;
    
    UIView *secondView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10,CGRectGetMidY(self.view.bounds)-self.view.bounds.size.width/2,self.view.frame.size.width/4*3, self.view.frame.size.height/2)];
    secondView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:secondView];
    
    UIScreenEdgePanGestureRecognizer *screenEdgeGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePanGestureRecognizer:)];
    screenEdgeGesture.edges = UIRectEdgeRight;
    self.screenEdge = screenEdgeGesture;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanGestureRecognizer:)];
    self.pan = panGesture;
    self.pan.enabled = NO; //sets it off
    
    [secondView addGestureRecognizer:screenEdgeGesture];
    [secondView addGestureRecognizer:panGesture];
    
}

-(IBAction)panGestureRecognizer:(UIPanGestureRecognizer *)sender{
    if(self.isShowing){
        CGRect newFrame = sender.view.frame;
        newFrame.origin.x -= [sender locationInView:sender.view].x;
        sender.view.frame = newFrame;
    }else{
        //self.pan.enabled = NO;
        //self.screenEdge.enabled = YES;
    }
}

-(IBAction)screenEdgePanGestureRecognizer:(UIGestureRecognizer *)sender{
    CGRect newFrame = sender.view.frame;
    
    if(!self.isShowing) {
        if([sender locationInView:self.view].x <= self.view.frame.size.width/3*2){
            self.screenEdge.enabled = NO;
            newFrame.origin.x = self.view.frame.size.width/4*1;
            [UIView animateWithDuration:0.2 animations:^{
                sender.view.frame = newFrame;
            }];
            self.pan.enabled = YES;
            self.isShowing = YES;
        }else{
            newFrame.origin.x += [sender locationInView:sender.view].x;
            sender.view.frame = newFrame;
            
            if((sender.state == UIGestureRecognizerStateEnded) && ([sender locationInView:self.view].x >= self.view.frame.size
                                                                   .width/3*2)){
                newFrame.origin.x = CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10;
                [UIView animateWithDuration:0.2 animations:^{
                    sender.view.frame = newFrame;
                }];
            }
            
        }
    }else{
        if([sender locationInView:self.view].x >= self.view.frame.size.width/3*2){
            self.pan.enabled = NO;
            newFrame.origin.x = CGRectGetMidX(self.view.bounds) + self.view.bounds.size.width/2-10;
            [UIView animateWithDuration:0.2 animations:^{
                sender.view.frame = newFrame;
            }];
            self.screenEdge.enabled = YES;
            self.isShowing = NO;
        }else{
            newFrame.origin.x += [sender locationInView:sender.view].x;
            sender.view.frame = newFrame;
            if((sender.state == UIGestureRecognizerStateEnded) && ([sender locationInView:self.view].x <= self.view.frame.size.width/3*2)){
                newFrame.origin.x = self.view.frame.size
                .width/4*1;
                [UIView animateWithDuration:0.2 animations:^{
                    sender.view.frame = newFrame;
                }];
            }
            
        }
    }
}


@end
