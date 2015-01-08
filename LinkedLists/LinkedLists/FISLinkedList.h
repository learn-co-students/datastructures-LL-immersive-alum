//
//  FISLinkedList.h
//  LinkedLists
//
//  Created by Chris Gonzales on 12/11/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FISNode;

// This protocol is here to ensure that both the FISNode class provided and the FISFakeNode class in your tests have these properties. This protocol describes a contract with the minimum amount of information the FISLinkedList needs from a subscriber of Node to be able to test it.
@protocol Node <NSObject>
@required
@property (strong, nonatomic) id <Node> nextNode;
@property (strong, nonatomic) id <Node> previousNode;
@property (strong, nonatomic) NSString *content;
@end


@interface FISLinkedList : NSObject

@property (nonatomic, readonly) NSUInteger count;

- (instancetype)initWithNodeArray:(NSArray *)array;
- (NSString *)objectAtIndex:(NSUInteger)index;
- (void)insertFirstObject:(NSString *)object;
- (NSString *)removeFirstObject;
- (void)addObject:(NSString *)object;
- (NSString *)removeLastObject;
- (void)insertObject:(NSString *)object atIndex:(NSUInteger)index;
- (NSString *)removeObjectatIndex:(NSUInteger)index;
- (BOOL)indcludes:(NSString *)object;
- (FISLinkedList *)reverse;

@end
