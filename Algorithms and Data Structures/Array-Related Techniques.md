# Array-related Techniques

## Stacks and Queues

Questions on stacks and queues will be much easier to handle if you are comfortable with the ins and outs of the data structure. The problems can be quite tricky though. While some problems might be slight modification on the original data structure, others will have much more complex challenges.

## Implementing a stack
The stack data structure is precisely what it sounds like: a stack of data.

A stack uses LIFO (last-in first-out) ordering. That is, as in a stack of dinner plates. The most recent item added to the stack is the first item to be removed

Stacks will have the following operations
`pop()`: Remove the top item from the stack
`push(item)`: Add an item to the top of the stack
`peek()`: Return the top of the stack
`isEmpty()`: Return true if and only if the stack is empty

Unlike an array a stack does not offer constant time access to the ith item. However it does allow constant time adds and removes, as it doesn't require shifting elements around
One case where stacks are often useful is in certain recursive algorithms.
Sometimes you need to push temporary data onto a stack as you recurse, but the remove them as you backtrack (for example, because the recursive check failed). A stack offers an intuitive way to do this.

At stack can also be used to implement a recursive algorithm iteratively. 

## Implementing a Queue
A queue implements FIFO (first in first out) ordering. As in a line or queue at a ticket stand items are removed from the data structure in the same order that they are added.

`add(item)`: Add an item to the end of the list
`remove()`: Remove the first time in the list
`peek()`: Return the top of the queue
`isEmpty()`: Return true if and only if the queue is empty

It is especially easy to mess up the updating of the first and last nodes in the queue. Be sure to double check
One place where queues are often used is in breadth first search or in implementing a cache

In breadth-first search, for example we used a queue to store a list of the nodes that we need to process. Each time we process a node, we add its adjacent nodes to the back of the queue. This allows us to process nodes in the order in which they are viewed
