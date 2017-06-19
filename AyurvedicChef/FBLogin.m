//
//  FBLogin.m
//  AyurvedicChef
//
//  Created by asc6 on 5/3/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import "FBLogin.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FBLogin ()

@end

@implementation FBLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    
    loginButton.center = self.view.center;
    // Optional: Place the button in the center of your view.
/*    loginButton.frame = CGRectMake(55, 337,211, 30);
    
    [loginButton setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [loginButton setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
    [loginButton setAutoresizingMask:UIViewAutoresizingFlexibleRightMargin];
    [loginButton setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];*/

    [self.view addSubview:loginButton];
    
    loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    
    if ([FBSDKAccessToken currentAccessToken])
    {
        
      //  [self fbloginbtn:self];
     /*   NSString * storyboardName = @"Main";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
        UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"StartPage"];
        [self presentViewController:vc animated:NO completion:nil];
       */
        
        
        
    }
  
}
/*
- (IBAction)fbloginbtn:(id)sender
{
    NSString * storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"StartPage"];
    [self presentViewController:vc animated:NO completion:nil];
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
