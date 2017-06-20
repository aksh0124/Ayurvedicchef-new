//
//  JsonRecipeTableTableViewController.m
//  AyurvedicChef
//
//  Created by asc6 on 6/8/17.
//  Copyright © 2017 asc3. All rights reserved.
//

#import "JsonRecipeTableTableViewController.h"
#import "ViewController.h"
#import "SearchRecipiesViewController.h"

@implementation JsonRecipeTableTableViewController
@synthesize category, time, type;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Recipes";
    
    SearchRecipiesViewController *srvc = [[SearchRecipiesViewController alloc] init];
    srvc.label1.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"category"];
    srvc.label2.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"time"];
    srvc.label3.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"type"];
   
    [self setCategory:category];
    [self setTime:time];
    [self setType:type];
    
    NSError *error;
    NSString *url = [NSString stringWithFormat:@"http://anantsoftcomputing.com/saralayur/ayurrecipelist.php?format=json&category=%@&time=%@&type=%@",category,time,type];
    NSData *Data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSMutableArray *json =[NSJSONSerialization JSONObjectWithData:Data options:kNilOptions error:&error];
    NSLog(@"JSON: %@", json);
 //   [self retrieveData];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response
{
    data = [[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)theData
{
    [data appendData:theData];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    recipe_array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    [recipeMainTable reloadData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Problem in loading data, check your internet connection" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
    [alert show];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [recipe_array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    
    // Configure the cell...
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainCell"];
    }

    
  /*  cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
  
    RecipeDetail *currentRecipe = [recipearray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentRecipe.recipe_name;
    cell.detailTextLabel.text = currentRecipe.category;
   */
    
    cell.textLabel.text = [[recipe_array objectAtIndex:indexPath.row] objectForKey:@"rec-name"];
    cell.detailTextLabel.text = [[recipe_array objectAtIndex:indexPath.row] objectForKey:@"category"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    vc.title = [[recipe_array objectAtIndex:indexPath.row] objectForKey:@"rec-name"];
    vc.recipeDict = [recipe_array objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
    
  /*RecipeDetail *currentRecipe = [recipearray objectAtIndex:indexPath.row];
    vc.name = currentRecipe.recipe_name;
    vc.detail = currentRecipe.recipe_detail; 
   */
    
}

/*
-(void)retrieveData
{
  //  SearchRecipiesViewController *srvc;
    
    
    NSString *strurl = [NSString stringWithFormat:@"http://anantsoftcomputing.com/saralayur/ayurrecipelist.php?format=json&category=%@&time=%@&type=%@",category,time,type];
    
    NSURL *url = [NSURL URLWithString:strurl];
    NSData *data = [NSData dataWithContentsOfURL:url];
 
    jsonarray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    recipearray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<jsonarray.count; i++)
    {
        NSString *Rid = [[jsonarray objectAtIndex:i] objectForKey:@"id"];
        NSString *Rname = [[jsonarray objectAtIndex:i] objectForKey:@"rec-name"];
        NSString *Rdetail = [[jsonarray objectAtIndex:i] objectForKey:@"recipe"];
        NSString *Rtype = [[jsonarray objectAtIndex:i] objectForKey:@"type"];
        NSString *Rtime = [[jsonarray objectAtIndex:i] objectForKey:@"time"];
        NSString *Rcategory = [[jsonarray objectAtIndex:i] objectForKey:@"category"];
        
        
        RecipeDetail *recipeObject = [[RecipeDetail alloc]initWithRec_id:Rid secondRec_name:Rname thirdRec_detail:Rdetail forthRec_type:Rtype fifthRec_time:Rtime sixthRec_category:Rcategory];
        
        [recipearray addObject:recipeObject];
    }
    
    [self.recipetable reloadData];
   
    
    
  //  NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
 //   NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
}
*/






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
