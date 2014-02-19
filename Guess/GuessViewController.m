//
//  GuessViewController.m
//  Guess
//
//  Created by blur on 14-2-19.
//  Copyright (c) 2014年 blur. All rights reserved.
//

#import "GuessViewController.h"

@interface GuessViewController ()

@end

@implementation GuessViewController{
    int score, round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int zero = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",zero];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",zero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chooseItem1
{
    //剪刀－0
    int i = 0;
    NSString *user = @"剪刀";
    NSString *sys;
    int random = [self randomItem];
    if(random == 0){
        sys = @"剪刀";
    }else if(random == 1){
        sys = @"石头";
    }else{
        sys = @"布";
    }
    int winOrLost = [self userItem:(int)i randomItem:(int)random];
    [self showAlert:(int)winOrLost user:(NSString *)user sys:(NSString *)sys];
}

- (IBAction)chooseItem2
{
    //石头-1
    int i = 1;
    NSString *user = @"石头";
    NSString *sys;
    int random = [self randomItem];
    if(random == 0){
        sys = @"剪刀";
    }else if(random == 1){
        sys = @"石头";
    }else{
        sys = @"布";
    }
    int winOrLose = [self userItem:(int)i randomItem:(int)random];
    [self showAlert:(int)winOrLose user:(NSString *)user sys:(NSString *)sys];
}

- (IBAction)chooseItem3
{
    //布-2
    int i = 2;
    NSString *user = @"布";
    NSString *sys;
    int random = [self randomItem];
    if(random == 0){
        sys = @"剪刀";
    }else if(random == 1){
        sys = @"石头";
    }else{
        sys = @"布";
    }
    int winOrLose = [self userItem:(int)i randomItem:(int)random];
    [self showAlert:(int)winOrLose user:(NSString *)user sys:(NSString *)sys];
}

- (int)randomItem
{
    //生成随机0-2的随机数，表示系统随机出的结果
    int result = arc4random() % 3;
    NSLog(@"%d",result);
    return result;
}

- (int)userItem: (int)item1 randomItem: (int)item2
{
    //判断胜负 0-lost 1-win 2-equal
    //0-jd 1-st 2-b
    if(item1 == 0){
        if(item2 == 0){
            return 2;
        }else if(item2 == 1){
            return 0;
        }else{
            return 1;
        }
    }else if(item1 == 1){
        if(item2 == 0){
            return 1;
        }else if(item2 == 1){
            return 2;
        }else{
            return 0;
        }
    }else{
        if(item2 == 0){
            return 0;
        }else if(item2 == 1){
            return 1;
        }else{
            return 2;
        }
    }
}

- (IBAction)showAlert:(int)winOrLose user:(NSString *)s1 sys:(NSString *)s2
{
    NSString *message;
    NSString *title;
    if(winOrLose == 0){
        //lose
        title = @"sorry,你输了- -";
        NSLog(@"user:%@",s1);
        NSLog(@"sysRandom:%@",s2);
        message = [NSString stringWithFormat: @"你出的是 %@,系统出的是 %@, %@",s1,s2,title];
        
    }else if(winOrLose == 1){
        //win
        title = @"oh,你赢了！：）";
        message = [NSString stringWithFormat: @"你出的是 %@,系统出的是 %@, %@",s1,s2,title];
        score += 1;
        NSLog(@"user:%@",s1);
        NSLog(@"sysRandom:%@",s2);
    }else{
        //equal
        title = @"平局TAT";
        message = [NSString stringWithFormat: @"你出的是 %@,系统出的是 %@, %@",s1,s2,title];
        NSLog(@"user:%@",s1);
        NSLog(@"sysRandom:%@",s2);
    }
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle: title
                              message: message
                              delegate: nil
                              cancelButtonTitle: @"ok"
                              otherButtonTitles: nil];
    [alertView show];
    round += 1;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d", round];
}

@end
