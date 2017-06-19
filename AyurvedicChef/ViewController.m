//
//  ViewController.m
//  AyurvedicChef
//
//  Created by asc3 on 18/02/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize recipeDict;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    recipe_name.text = [recipeDict objectForKey:@"rec-name"];
    recipe_details.text = [recipeDict objectForKey:@"recipe"];
    recipe_category.text = [recipeDict objectForKey:@"category"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
