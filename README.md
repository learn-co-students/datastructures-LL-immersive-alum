---
tags: CS, linkedlists, data structures
languages: objc
---


# Linked Lists

Let's make a mutable, doubly linked list class. **You can assume all data will be NSStrings**

## Requirements

Should be able to:

| Operation                   | Time     |
|-----------------------------|----------|
| Access Given Index          | Linear   |
| Insert /Delete At Beginning | Constant |
| Insert/Delete At End        | Constant |
| Insert/Delete in Middle     | Linear   |
| Count                       | Constant |
| Contains                    | Linear   |
| Reverse                     | Linear   |

Go ahead and create the appropriate methods for the operations. You may be able to consolidate the operations into one method. I'd use the methods available to the `NSMutableArray` class as a good reference for what sort of methods you need to write.

**You may not use an Array while creating your Linked List**

## Example Usage

```objc

FISLinkedList *myList = [[FISLinkedList alloc] init];
[myList addObject:@"Joe"]; // LL is now Joe
[myList addObject:@"Al"]; // LL is now Joe, Al
[myList addObject:@"Chris"]; // LL is now Joe, Al, Chris

NSLog(@"%@",[myList objectAtIndex:1]); //Prints out Al

[myList removeObjectAtIndex:1]; //LL is now Joe, Chris

[myList addObject:@"Avi" atIndex:0] // LL is now Avi, Joe, Chris

[myList reverse] // LL is now Chris, Joe, Avi

NSLog(@"%d", [myList count]) //Prints out 3
```

## Resources

  * [Linked List](http://en.wikipedia.org/wiki/Linked_list)
  * [The First Class I ever TAed still has it's LL explanation up! It's in Java though](http://www.cs.cmu.edu/~adamchik/15-121/lectures/Linked%20Lists/linked%20lists.html)
  * [Linked List in Plain English...sorta](https://www.youtube.com/watch?v=oiW79L8VYXk)
