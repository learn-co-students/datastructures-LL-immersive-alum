//
//  FISLinkedListSpec.m
//  LinkedLists
//
//  Created by Chris Gonzales on 12/12/14.
//  Copyright 2014 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISLinkedList.h"
#import <Expecta/Expecta.h>
#define EXP_SHORTHAND

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>
#import "FISFakeNode.h"


SpecBegin(FISLinkedList)

describe(@"FISLinkedList", ^{
    
    __block FISLinkedList *linkedList;
    __block FISFakeNode *node1;
    __block FISFakeNode *node2;
    __block FISFakeNode *node3;
    __block FISLinkedList *emptyList;
    
    beforeEach(^{
        node1 = [[FISFakeNode alloc] init];
        node1.content = @"Node 1!";
        node2 = [[FISFakeNode alloc] init];
        node2.content = @"Node 2!";
        node3 = [[FISFakeNode alloc] init];
        node3.content = @"Node 3!";
        
        linkedList = [[FISLinkedList alloc] initWithNodeArray:@[node1, node2, node3]];
        emptyList = [[FISLinkedList alloc] init];
        
    });
    
    afterEach(^{
        node1 = nil;
        node2 = nil;
        node3 = nil;
    });
    
    describe(@"get object at index", ^{
        context(@"when given a valid index", ^{
            it(@"should return the object at the given index", ^{
                NSString *nodeContent = [linkedList objectAtIndex:2];
                expect(nodeContent).to.equal([node3 content]);
            });
        });
        
        context(@"when given invaled input", ^{
            it(@"should return nil",^{
                expect([linkedList objectAtIndex:5]).to.beNil();
            });
        });
    });
    
    describe(@"count objects in list", ^{
        context(@"when there are no items in the list", ^{
            it(@"should return that there are 0 items in the list",^{
                
                expect([emptyList count]).to.equal(0);
            });
        });
        
        context(@"when there are items in the list", ^{
            it(@"should return the number of items in the list",^{
                expect([linkedList count]).to.equal(3);
            });
        });
    });
    
    describe(@"insert at beginning of list", ^{
        
        __block NSString *objectToInsert;
        __block NSUInteger countBefore;
        
        beforeAll(^{
            objectToInsert = @"First Inserted Item!";
            countBefore = [linkedList count];
        });
        
        context(@"when the list is empty", ^{
            
            beforeEach(^{
                [emptyList insertFirstObject:objectToInsert];
            });
            
            it(@"should add the object at index 0",^{
                expect([emptyList objectAtIndex:0]).to.equal(objectToInsert);
            });
            
            it(@"should increment the count by 1",^{
                expect([emptyList count]).to.equal(1);
            });
        });
        
        context(@"when there are items in the list", ^{
            
            beforeEach(^{
                [linkedList insertFirstObject:@"First Inserted Item!"];
            });
            
            it(@"should add the object at index 0",^{
                expect([linkedList objectAtIndex:0]).to.equal(objectToInsert);
            });
            
            it(@"should increment the count by 1",^{
                expect([linkedList count]).to.equal(countBefore+1);
            });
        });
    });
    
    describe(@"remove object at the beginning of the list", ^{
        __block NSUInteger countBefore;
        
        beforeEach(^{
            countBefore = [linkedList count];
        });
        
        context(@"when there are no items in the list", ^{
            it(@"should return nil",^{
                expect([emptyList removeFirstObject]).to.beNil();
            });
            
            it(@"should have a count of zero",^{
                expect(emptyList.count).to.equal(0);
            });
        });
        
        context(@"when there are items in the list", ^{
            __block NSString *removedNodeContent;
            
            beforeEach(^{
                removedNodeContent = [linkedList removeFirstObject];
            });
            
            it(@"should return the first item in the list",^{
                expect(removedNodeContent).to.equal(node1.content);
            });
            
            it(@"should decrement the count by 1",^{
                expect(linkedList.count).to.equal(countBefore-1);
            });
        });
    });
    
    describe(@"inserting an object at the end of a list", ^{
        __block NSString *anObject = @"Last object added!";
        __block NSUInteger countBefore;
        
        beforeEach(^{
            countBefore = linkedList.count;
            [linkedList insertLastObject:anObject];
            [emptyList insertLastObject:anObject];
        });
        
        context(@"with a non-empty list", ^{
            it(@"should add the object at the end of the list",^{
                expect([linkedList objectAtIndex:linkedList.count-1]).to.equal(anObject);
            });
            
            it(@"should increment count by 1",^{
                expect(linkedList.count).to.equal(countBefore+1);
            });
        });
        
        context(@"with an empty list", ^{
            it(@"should add the object at the end of the list",^{
                expect([emptyList objectAtIndex:0]).to.equal(anObject);
            });
            
            it(@"should increment count by 1",^{
                expect(emptyList.count).to.equal(1);
            });

        });
        
    });
    
    describe(@"removing an object at the end of a list", ^{
        __block NSUInteger countBefore;
        __block NSString *removedNodeContent;
        __block NSString *emptyRemovedNodeContent;
        
        beforeEach(^{
            countBefore = linkedList.count;
            removedNodeContent = [linkedList removeLastObject];
            emptyRemovedNodeContent = [emptyList removeLastObject];
        });
        
        context(@"with a non-empty list", ^{
            it(@"should remove an obejct from the end of the list",^{
                expect(removedNodeContent).to.equal(node3.content);
            });
            
            it(@"should decrement the count by 1",^{
                expect(linkedList.count).to.equal(countBefore-1);
            });
        });
        
        context(@"with an empty list", ^{
            it(@"should return nil",^{
                expect(emptyRemovedNodeContent).to.beNil();
            });
            
            it(@"should have a count of zero",^{
                expect(emptyList.count).to.equal(0);
            });
        });
    });
    
    describe(@"inserting an object at a give index", ^{
        __block NSUInteger countBefore;
        __block NSString *anObject = @"I'm the inserted object!";
        
        
        context(@"with a non-empty list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                [linkedList insertObject:anObject atIndex:1];
            });
            
            it(@"should have the given object at that index",^{
                expect([linkedList objectAtIndex:1]).to.equal(anObject);
            });
            
            it(@"should increment the count by 1",^{
                expect(linkedList.count).to.equal(countBefore+1);
            });
        });
        
        context(@"as the last item in the list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                [linkedList insertObject:anObject atIndex:3];
            });
            
            it(@"should have the given object at that index",^{
                expect([linkedList objectAtIndex:3]).to.equal(anObject);
            });
            
            it(@"should increment the count by 1",^{
                expect(linkedList.count).to.equal(countBefore+1);
            });
        });
        
        context(@"as the first item in the list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                [linkedList insertObject:anObject atIndex:0];
            });
            
            it(@"should have the given object at that index",^{
                expect([linkedList objectAtIndex:0]).to.equal(anObject);
            });
            
            it(@"should increment the count by 1",^{
                expect(linkedList.count).to.equal(countBefore+1);
            });
        });
        
        context(@"with an empty list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                [emptyList insertObject:anObject atIndex:0];
            });
            
            it(@"should add the given object",^{
                expect([emptyList objectAtIndex:0]).to.equal(anObject);
            });
            
            it(@"should increment the count by 1",^{
                expect(emptyList.count).to.equal(1);
            });
        });
    });
    
    describe(@"removing an object at a given index", ^{
        __block NSUInteger countBefore;
        __block NSString *result;
        
        context(@"with a non-empty list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                result = [linkedList removeObjectatIndex:1];
            });
            
            it(@"should have the given object at that index",^{
                expect(result).to.equal(node2.content);
            });
            
            it(@"should increment the count by 1",^{
                expect(linkedList.count).to.equal(countBefore-1);
            });
        });
        
        context(@"as the last item in the list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                result = [linkedList removeObjectatIndex:2];
            });
            
            it(@"should have the given object at that index",^{
                expect(result).to.equal(node3.content);
            });
            
            it(@"should increment the count by 1",^{
                expect(linkedList.count).to.equal(countBefore-1);
            });
        });

        context(@"as the first item in the list", ^{
            
            beforeEach(^{
                countBefore = linkedList.count;
                result = [linkedList removeObjectatIndex:0];
            });
            
            it(@"should have the given object at that index",^{
                expect(result).to.equal(node1.content);
            });
            
            it(@"should increment the count by 1",^{
                expect(linkedList.count).to.equal(countBefore-1);
            });
        });

        context(@"with an empty list", ^{
            
            beforeEach(^{
                result = [emptyList removeObjectatIndex:0];
            });
            
            it(@"should add the given object",^{
                expect(result).to.beNil();
            });
            
            it(@"should increment the count by 1",^{
                expect(emptyList.count).to.equal(0);
            });
        });
        
        context(@"with a list with 1 item", ^{
            
            beforeEach(^{
                [emptyList insertLastObject:@"Just one item"];
                countBefore = emptyList.count;
                result = [emptyList removeObjectatIndex:0];
            });
            
            it(@"should have the given object at that index",^{
                expect(result).to.equal(@"Just one item");
            });
            
            it(@"should increment the count by 1",^{
                expect(emptyList.count).to.equal(0);
            });
        });
    });
    
    describe(@"contains", ^{
        context(@"when the list contains the parameter object", ^{
            it(@"should return true",^{
                expect([linkedList indcludes:@"Node 2!"]).to.beTruthy();
            });
        });
        
        context(@"when the list does not contain the parameter object", ^{
            it(@"should return false",^{
                expect([emptyList indcludes:@"Node 2!"]).to.beFalsy();
            });
        });
        
    });
    
    describe(@"reverse", ^{
        context(@"when the list contains more than 1 obejct", ^{
            it(@"should return the linked list in reverse order",^{
                FISLinkedList *reversed = [linkedList reverse];
                
                expect([reversed objectAtIndex:0]).to.equal([linkedList objectAtIndex:2]);
                expect([reversed objectAtIndex:1]).to.equal([linkedList objectAtIndex:1]);
                expect([reversed objectAtIndex:2]).to.equal([linkedList objectAtIndex:0]);
            });
        });
        
        context(@"when the list contains 1 object", ^{
            it(@"should return the original linked list",^{
                [emptyList insertLastObject:@"The only object!"];
                FISLinkedList *reversed = [emptyList reverse];
                expect([reversed objectAtIndex:0]).to.equal([emptyList objectAtIndex:0]);
                expect(reversed.count).to.equal(1);
            });
            
        });
        
        context(@"when the list is empty", ^{
            it(@"should return the original list",^{
                FISLinkedList *reversed = [emptyList reverse];
                expect(reversed.count).to.equal(0);
            });
        });
    });
    
});

SpecEnd
