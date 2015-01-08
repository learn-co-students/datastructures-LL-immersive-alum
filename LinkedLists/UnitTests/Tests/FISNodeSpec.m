//
//  FISNodeSpec.m
//  LinkedLists
//
//  Created by Chris Gonzales on 12/12/14.
//  Copyright 2014 The Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISNode.h"
#import <Expecta/Expecta.h>
#define EXP_SHORTHAND

SpecBegin(FISNode)

describe(@"FISNode", ^{
    FISNode *node = [[FISNode alloc] init];
    
    describe(@"content property", ^{
        it(@"should be settable",^{
            expect(node).to.respondTo(@selector(setContent:));
        });
        
        it(@"should be accessible",^{
            expect(node).to.respondTo(@selector(content));
        });
    });
    
    describe(@"nextNode", ^{
        it(@"should be settable",^{
            expect(node).to.respondTo(@selector(setNextNode:));
        });
        
        it(@"should be accessible",^{
            expect(node).to.respondTo(@selector(nextNode));
        });
    });
    
    describe(@"previousNode", ^{
        it(@"should be settable",^{
            expect(node).to.respondTo(@selector(setPreviousNode:));
        });
        
        it(@"should be accessible",^{
            expect(node).to.respondTo(@selector(previousNode));
        });
    });
});

SpecEnd
