//
//  XYZToDoListViewController.h
//  ios_101
//
//  Created by jeanepaul on 2014/03/01.
//  Copyright (c) 2014年 jeanepaul. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XYZToDoListViewController : UITableViewController

-(IBAction)unwindToList:(UIStoryboardSegue *)segue;

@property NSMutableArray *toDoItems;

@end
