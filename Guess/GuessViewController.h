//
//  GuessViewController.h
//  Guess
//
//  Created by blur on 14-2-19.
//  Copyright (c) 2014年 blur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuessViewController : UIViewController

- (IBAction)chooseItem1;
- (IBAction)chooseItem2;
- (IBAction)chooseItem3;
- (IBAction)showAlert:(int)winOrLose user:(NSString *)s1 sys:(NSString *)s2;


@property(nonatomic, strong)IBOutlet UILabel *scoreLabel;
@property(nonatomic, strong)IBOutlet UILabel *roundLabel;


@end
