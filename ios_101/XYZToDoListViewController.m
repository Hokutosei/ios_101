//
//  XYZToDoListViewController.m
//  ios_101
//
//  Created by jeanepaul on 2014/03/01.
//  Copyright (c) 2014年 jeanepaul. All rights reserved.
//

#import "XYZToDoListViewController.h"
#import "XYZToDoItem.h"
#import "XYZAddToDoItemViewController.h"

@interface XYZToDoListViewController ()

@end

@implementation XYZToDoListViewController

-(IBAction)unwindToList:(UIStoryboardSegue *)segue {
    NSDate *date = [NSDate date];
    
    int n = 5;
    NSNumber *numberObject = [NSNumber numberWithInt:n];
    
    int y = [numberObject intValue];
    
    NSLog(@"this is called %@ with value %i", date, y);
    
    NSString *anotherString  = [NSString stringWithFormat:@"%d %@", y, @"String"];
    
    NSString *fromCString = [NSString stringWithCString:"A C String" encoding:NSUTF8StringEncoding];
    
    NSLog(@"another string %@", anotherString);
    
    NSLog(@"c string %@", fromCString);
    
    NSNumber *myFloatValue = @3.2F;
    
    
    NSLog(@"%@", myFloatValue);
    
    //NSArray *firstArr = [NSArray arrayWithObjects: anotherString, fromCString, myFloatValue, nil];
    NSArray *firstArr = @[anotherString, fromCString, myFloatValue];
    
    NSLog(@"--------");
    
    for (int i = 0; i < [firstArr count]; i++) {
            NSLog(@"%@", firstArr[i]);
    };
    
    NSArray *unsortedStrings = @[@"gammaString", @"alphaString", @"betaString"];
    NSArray *sortedStrings =  [unsortedStrings sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"sorted strings %@", sortedStrings);
    
    NSMutableString *mutableString = [NSMutableString stringWithString:@"Hello"];
    NSArray *immutableArray = @[mutableString];
    
    NSLog(@"%@", immutableArray);
    id string = immutableArray[0];
    if ([string isKindOfClass:[NSMutableString class]]) {
        [string appendString:@" World!"];
        NSLog(@"%@", immutableArray);
    }
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (int i = 0; i < [unsortedStrings count]; i++) {
        [mutableArray addObject:[unsortedStrings objectAtIndex:i]];
    }

    NSLog(@"mutable array %@", mutableArray);
    
    NSSet *simpleSet = [NSSet setWithObjects:@"hello world", @42, unsortedStrings[0], unsortedStrings[2], nil];
    NSLog(@"simpleset %@", simpleSet);
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                unsortedStrings[1], @"anObject",
                                @"hello world", @"helloString",
                                @42, @"magicNumber",
                                unsortedStrings[2], @"aValue",
                                nil];
    NSDictionary *dictionaryShort = @{
                                      @"anObject": unsortedStrings[1],
                                      @"helloString" : @"hello world",
                                      @"magicNumber" : @42,
                                      @"aValue" : unsortedStrings
                                      };
//    [dictionaryShort setObject: @"anotherString" forKey:@"secondString"];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
    [mutableDictionary setObject:@"anotherString" forKey:@"secondString"];
    NSLog(@"%@", mutableDictionary);
    
    NSLog(@"%@", dictionaryShort);
    NSLog(@"%@", dictionary[@"magicNumber"]);
    
    
//    NSLog(@"%@", dictionary);
    XYZAddToDoItemViewController *source = [segue sourceViewController];
    XYZToDoItem *item = source.toDoItem;
    if(item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadInitialData {
    XYZToDoItem *item1  = [[XYZToDoItem alloc] init];
    item1.itemName = @"buy milk";
    [self.toDoItems addObject:item1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    XYZToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    XYZToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
