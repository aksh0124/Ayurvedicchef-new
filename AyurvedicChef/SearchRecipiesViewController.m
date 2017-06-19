//
//  SearchRecipiesViewController.m
//  AyurvedicChef
//
//  Created by asc3 on 18/02/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import "SearchRecipiesViewController.h"


@interface SearchRecipiesViewController ()

@end

@implementation SearchRecipiesViewController

int buttontouched = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    _Array1 = [[NSArray alloc]initWithObjects:@"Shake",@"Salad",@"Meal",@"Appetizer",@"Snacks",@"Entrees",@"Deserts",@"Condiments",@"Beverages", nil];
    _Array2 = [[NSArray alloc]initWithObjects:@"Breakfast",@"Lunch",@"Brunch",@"Dinner", nil];
    _Array3 = [[NSArray alloc]initWithObjects:@"Vata",@"Pitta",@"Kapha",@"Neutral", nil];
    
     _picker.delegate = self;
    _picker.dataSource = self;
   _picker.hidden = YES;
    
    
    // Do any additional setup after loading the view.
}





- (IBAction)dropbtn1:(id)sender
{
    buttontouched = 0;
   
    self.Array1 = self.Array1;
    [self.picker reloadAllComponents];
    if(flag == 1)
    {
        flag=0;
        _picker.hidden=NO;
        [sender setTitle:@"▲" forState:UIControlStateNormal];
    }
    else
    {
        flag=1;
        _picker.hidden=YES;
        [sender setTitle:@"▼" forState:UIControlStateNormal];
    }

}

- (IBAction)dropbtn2:(id)sender
{
    buttontouched = 1;
    [self.picker reloadAllComponents];
    self.Array2 = self.Array2;
    [self.picker reloadAllComponents];
    if(flag == 1)
    {
        flag=0;
        _picker.hidden=NO;
        [sender setTitle:@"▲" forState:UIControlStateNormal];
    }
    else
    {
        flag=1;
        _picker.hidden=YES;
        [sender setTitle:@"▼" forState:UIControlStateNormal];
    }

}

- (IBAction)dropbtn3:(id)sender
{
    buttontouched = 2;
    [self.picker reloadAllComponents];
    self.Array3 = self.Array3;
    [self.picker reloadAllComponents];
    if(flag == 1)
    {
        flag=0;
        _picker.hidden=NO;
        [sender setTitle:@"▲" forState:UIControlStateNormal];
    }
    else
    {
        flag=1;
        _picker.hidden=YES;
        [sender setTitle:@"▼" forState:UIControlStateNormal];
    }

}

- (IBAction)findbtn:(id)sender
{
    JsonRecipeTableTableViewController *jrtv;
    jrtv.category = self.label1;
    jrtv.time = self.label2;
    jrtv.type = self.label3;
    
/*    NSString *category = @"category";
    NSString *time = @"time";
    NSString *type = @"type";
    
    _label1.text = category;
    _label2.text = time;
    _label3.text = type;
    
   NSString *strurl = [NSString stringWithFormat:@"http://anantsoftcomputing.com/saralayur/ayurrecipelist.php?format=json&category=%@&time=%@&type=%@",category,time,type];
    
    NSURL *url = [NSURL URLWithString:strurl];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];*/
  
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
     _rows=0;
    switch (buttontouched)
    {
        case 0:
        {
            _rows = [_Array1 count];
            break;
        }
        case 1:
        {
            _rows = [_Array2 count];
            break;
        }
        case 2:
        {
            _rows = [_Array3 count];
            break;
        }
         
        default:
        { break;}
    }
    return _rows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    _rows=0;
    switch (buttontouched)
    {
        case 0:
        {
            return [_Array1 objectAtIndex:row];
            break;
        }
        case 1:
        {
            return [_Array2 objectAtIndex:row];
            break;
        }
        case 2:
        {
            return [_Array3 objectAtIndex:row];
            break;
        }
        default:
        { break;}
    }
   return 0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _rows=0;
    switch (buttontouched)
    {
        case 0:
        {
            self.label1.text = [_Array1 objectAtIndex:row];
            break;
        }
        case 1:
        {
            self.label2.text = [_Array2 objectAtIndex:row];
            break;
        }
        case 2:
        {
            self.label3.text = [_Array3 objectAtIndex:row];
            break;
        }
        default:
        { break;}
    }

}

-(IBAction)mainlogout:(id)sender
{
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"FBMainLogin" ];
     [self presentViewController:vc animated:NO completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
