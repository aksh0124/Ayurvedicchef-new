//
//  SignupViewController.h
//  AyurvedicChef
//
//  Created by asc3 on 18/02/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *re_password;
@property (strong, nonatomic) IBOutlet UIButton *signupbtn;
- (IBAction)signup:(id)sender;
- (IBAction)outtomain:(id)sender;


@end
