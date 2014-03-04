//
//  XYZToDoItem.h
//  ios_101
//
//  Created by jeanepaul on 2014/03/04.
//  Copyright (c) 2014年 jeanepaul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
