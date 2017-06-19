//
//  ViewController.h
//  AyurvedicChef
//
//  Created by asc3 on 18/02/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSDictionary *recipeDict;
    IBOutlet UILabel *recipe_name;
    IBOutlet UITextView *recipe_details;
    IBOutlet UILabel *recipe_category;
}

@property (nonatomic, copy) NSDictionary *recipeDict;

@end

