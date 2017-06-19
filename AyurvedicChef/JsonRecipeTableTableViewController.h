//
//  JsonRecipeTableTableViewController.h
//  AyurvedicChef
//
//  Created by asc6 on 6/8/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchRecipiesViewController.h"

@interface JsonRecipeTableTableViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *recipe_array;
    NSMutableData *data;
    
    IBOutlet UITableView *recipeMainTable;
}



@property NSString *category;
@property NSString *time;
@property NSString *type;

//-(void) retrieveData;

@end
