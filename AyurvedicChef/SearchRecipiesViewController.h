//
//  SearchRecipiesViewController.h
//  AyurvedicChef
//
//  Created by asc3 on 18/02/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JsonRecipeTableTableViewController.h"

@interface SearchRecipiesViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    BOOL flag;
}

- (IBAction)mainlogout:(id)sender;



@property NSInteger *rows;
@property NSArray *Array1,*Array2,*Array3;

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (retain, nonatomic) IBOutlet UILabel *label1;
@property (retain, nonatomic) IBOutlet UILabel *label2;
@property (retain, nonatomic) IBOutlet UILabel *label3;

- (IBAction)dropbtn1:(id)sender;
- (IBAction)dropbtn2:(id)sender;
- (IBAction)dropbtn3:(id)sender;

- (IBAction)findbtn:(id)sender;

@end
