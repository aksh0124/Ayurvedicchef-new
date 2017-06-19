//
//  LoginViewController.m
//  AyurvedicChef
//
//  Created by asc3 on 18/02/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"Registered"])
    {
        NSLog(@"No user is registerd");
    }
    else
    {
        NSLog(@"User is registerd");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)AppLoginbtn:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  //  NSUserDefaults.standardUserDefaults.synchronize;
    if ([_username.text isEqualToString:[defaults objectForKey:@"username"]] && [_password.text isEqualToString:[defaults objectForKey:@"password"]])
    {
        NSLog(@"Login Credentials Match");
        
        UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Login Successful" message:@"" delegate:self cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        [success show];
        
        NSString * storyboardName = @"Main";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"SearchRecipe"];
        [self presentViewController:vc animated:NO completion:nil];
    }
    else
    {
        NSLog(@"Login Credentials doesnot Match");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oopps" message:@"Invalid username or password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }

 
    
    
    
    
}

- (IBAction)signup:(id)sender
{
    if ([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""] || [_re_password.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oopps" message:@"Must enter all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }
    else
    {
        [self checkPasswordMatch];
    }
}

- (void) checkPasswordMatch
{
    if ([_password.text isEqualToString:_re_password.text])
    {
        NSLog(@"Password Match");
        [self registerNewUser];
    }
    else
    {
        // NSLog(@"Password doesn't match");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oopps" message:@"Entered password does not matches" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
}

- (void) registerNewUser
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSUserDefaults.standardUserDefaults.synchronize;
    [defaults setObject:_username.text forKey:@"username"];
    [defaults setObject:_password.text forKey:@"password"];
    [defaults setBool:YES forKey:@"Registered"];
    
    [defaults synchronize];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Successful" message:@"New user registerd" delegate:self cancelButtonTitle:@"Done" otherButtonTitles: nil];
    
    [success show];
    
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"StartPage"];
    [self presentViewController:vc animated:NO completion:nil];
    
}

- (IBAction)outtomain:(id)sender
{
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc= [storyboard instantiateViewControllerWithIdentifier:@"FBMainLogin"];
    [self presentViewController:vc animated:NO completion:nil];
}
@end
