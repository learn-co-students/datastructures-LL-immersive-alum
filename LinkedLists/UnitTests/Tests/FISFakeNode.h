//
//  FISMockNode.h
//  LinkedLists
//
//  Created by Chris Gonzales on 12/18/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISLinkedList.h"

@interface FISFakeNode : NSObject <Node>

@property (strong, nonatomic) FISFakeNode *nextNode;
@property (strong, nonatomic) FISFakeNode *previousNode;
@property (strong, nonatomic) NSString *content;

@end
