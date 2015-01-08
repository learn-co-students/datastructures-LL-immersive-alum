//
//  FISNode.h
//  LinkedLists
//
//  Created by Chris Gonzales on 12/11/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISLinkedList.h"

@interface FISNode : NSObject <Node>

@property (strong, nonatomic) FISNode *nextNode;
@property (strong, nonatomic) FISNode *previousNode;
@property (strong, nonatomic) NSString *content;

@end
