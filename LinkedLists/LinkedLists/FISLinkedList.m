//
//  FISLinkedList.m
//  LinkedLists
//
//  Created by Chris Gonzales on 12/11/14.
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import "FISLinkedList.h"
#import "FISNode.h"

@interface FISLinkedList ()

@property (strong, nonatomic) id <Node> head;
@property (strong, nonatomic) id <Node> tail;
@property (nonatomic, readwrite) NSUInteger count;

@end

@implementation FISLinkedList

- (instancetype)initWithNodeArray:(NSArray *)array {
    self = [super init];
    if (self) {
        _count = 0;
        if (array.count > 0) {
            for (NSUInteger index = 0; index < array.count; index++) {
                FISNode *currentItem = array[index];
                NSUInteger lastIndex = array.count-1;
                
                if (index == 0) {
                    self.head = currentItem;
                    currentItem.previousNode = nil;
                } else {
                    
                    FISNode *previousItem = array[index-1];
                    [previousItem setNextNode:currentItem];
                    [currentItem setPreviousNode:previousItem];
                    
                    if (index == lastIndex) self.tail = currentItem;
                    currentItem.nextNode = nil;
                }
                _count++;
                
            }
        }
    }
    return self;
}

- (instancetype)init {
    return [self initWithNodeArray:nil];
}

- (NSString *)objectAtIndex:(NSUInteger)index {
    NSUInteger currentIndex = 0;
    id <Node> currentNode = self.head;
    
    do {
        if (currentIndex == index) {
            return currentNode.content;
        }
        
        currentIndex++;
        currentNode = currentNode.nextNode;
    } while (currentNode);
    
    return nil;
}

- (void)insertFirstObject:(NSString *)object {
    FISNode *newNode = [[FISNode alloc] init];
    newNode.content = object;
    
    newNode.nextNode = self.head;
    self.head = newNode;
    self.count++;
}

- (NSString *)removeFirstObject {
    FISNode *firstNode = self.head;
    self.head = firstNode.nextNode;
    self.count--;
    
    return firstNode.content;
}

- (void)insertLastObject:(NSString *)object {
    FISNode *newTail = [[FISNode alloc] init];
    newTail.content = object;
    
    if (self.tail) {
        FISNode *oldTail = self.tail;
        oldTail.nextNode = newTail;
        newTail.previousNode = oldTail;
    } else {
        self.head = newTail;
    }
    
    self.tail = newTail;
    self.count++;
}

- (NSString *)removeLastObject {
    FISNode *oldLastNode = self.tail;
    oldLastNode.previousNode.nextNode = nil;
    if (self.count > 0) self.count--;
    
    return oldLastNode.content;
}

- (void)insertObject:(NSString *)object atIndex:(NSUInteger)index {
    FISNode *newNode = [[FISNode alloc] init];
    newNode.content = object;
    
    NSUInteger currentIndex = 0;
    FISNode *currentNode = self.head;
    
    while (currentIndex <= self.count) {
        if (currentIndex == index) {
            
            if (currentNode) {
                newNode.nextNode = currentNode;
                newNode.previousNode = currentNode.previousNode;
                currentNode.previousNode.nextNode = newNode;
                currentNode.previousNode = newNode;
            } else {
                FISNode *oldTail = self.tail;
                oldTail.nextNode = newNode;
                newNode.previousNode = oldTail;
            }
            
            if (!newNode.previousNode) self.head = newNode;
            if (!newNode.nextNode) self.tail = newNode;
            
            self.count++;
            break;
        }
        
        currentIndex++;
        currentNode = currentNode.nextNode;
    }

}

- (NSString *)removeObjectatIndex:(NSUInteger)index {
    NSUInteger currentIndex = 0;
    FISNode *currentNode = self.head;
    
    while (currentIndex < self.count) {
        if (currentIndex == index) {
            FISNode *nodeBefore = currentNode.previousNode;
            FISNode *nodeAfter = currentNode.nextNode;
            
            nodeBefore.nextNode = nodeAfter;
            nodeAfter.previousNode = nodeBefore;
            
            if ([self.head isEqual:currentNode]) self.head = nil;
            if ([self.tail isEqual:currentNode]) self.tail = nil;
            
            self.count--;
            return currentNode.content;
        }
        
        currentIndex++;
        currentNode = currentNode.nextNode;
    }
    return nil;
}

- (BOOL)indcludes:(NSString *)object {
    FISNode *currentNode = self.head;
    
    while (currentNode) {
        if ([currentNode.content isEqualToString:object]) {
            return YES;
        }
        currentNode = currentNode.nextNode;
    }
    return NO;
}

- (FISLinkedList *)reverse {
    FISNode *currentNode = self.tail;
    
    FISLinkedList *reversedList = [[FISLinkedList alloc] init];
    
    while (currentNode) {
        [reversedList insertLastObject:currentNode.content];
        currentNode = currentNode.previousNode;
    }
    
    return reversedList;
}

@end
