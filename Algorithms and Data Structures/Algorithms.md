## Hash Maps are different from Hash tables

A hash table is a data structure that maps keys to values for highly efficient lookup. There are a number of ways of implementing this. Here we describe a simple but common implementation

First compute the key’s hash code which will usually be an int or long . Note that two different keys  could have the same hashcode, as there may be an infinite number of keys and a finite number of ints.

The map the hash code to an index in the array. This could be done with something like hash(key) % array_length. Two different hash codes could of course map to the same index
At this index, there is a linked list of keys and values. Store the key and value in this index. We must use a linked list because of collisions, you could have two different keys with the same has code, or two different hash codes that map to the same index

To retrieve the value pair by this key, you repeat this process. Compute the hash code from the key and the compute the index from the hash code. The, search through the linked list for the value with this key

If the number of collisions is very high,the worst case runtime id O(N), where N is the number of keys. However we generally assume a good implementation that keeps collisions to a minimum, in which case the lookup time is O(1)

## Linked List

A linked list is a data structure that represents a sequence of nodes. In a singly linked list, each node points to the next node in the linked list. A doubly linked list gives each node pointer to both the next node and previous node.

Unlike an array, a linked list does not provide constant time access to a particular index within the list. This means that if you’d like to find the Kth element in the list, you will need to iterate through K elements.

The benefits of a linked list is that you can add and remove items from the beginning of the list in constant time, For specific application that can be useful

## Stacks
The stack data structure is precisely what it sounds like, a stack of data. In certain types of problems, It can be favorable to store data in a stack rather than in an array

A stack uses LIFO (last in first out) ordering That is, as in a stack of dinner plates, the most recent item added to the stack is the first item to be removed

`pop()` removes the top item from the stack
`push(item)` add an item to the top of the stack
`peek()` return the top of the stack
`isEmpty()` return true if and only if the stack is empty

Unlike an array, a stack does not offer constant time access to the iths item. However it does allow constant time adds and removes as it doesn’t require shifting elements around

One case where stacks are often useful is in certain recursive algorithms, Sometimes you need to push temporary data onto a stack as you recurse, but the remove them as you backtrack (for example. Because the recursive check failed) A stack offers an intuitive way to do this.

A stack can also be used to implement a recursive algorithm Iteratively.

## Queue
A queue implements a FIFO (first in first out) ordering. As in a line or queue at a ticket stand, items are removed from the data structure in the same order that they are added

It uses the operations

`add(item)`: Add an item to the end of the list
`Remove()`: Remove the first item in the list
`peek()`: Return the top of the queue
`isEmpty()`: Return true if and only if the queue is empty

It is especially easy to mess up the updating of the first and last nodes in a queue. Be sure to double check this.

One place where queues are often used is in breadth-first search or in implementing a cache

## Breadth first search

In breadth first search, for example we used a queue to store a list of the nodes that we need to process. Each time we process a node, we add its adjacent nodes to the back of the queue. THis allows us to process nodes in the order in which they are viewed.


## Trees and Graphs
Any interviews find tree and graph problems to be some of the trickiest. Searching a tree is more complicated 

## Types of trees
A nice way to understand a tree is recursive explanation. A tree is a data structure composed of nodes.
Each tree has a root node 
The root node has zero or more child nodes
Each child node has zero or more child nodes

The tree cannot contain cycles. The nodes may or may not be in a particular order, they could have any data type as values and the may or may not have links back to their parent nodes

## Recursion and Dynamic Programming

While there are a large number of recursive problems, many of them follow similar patterns. A good hint that a problem is recursive is that it can be built off of sub-problems.

When you hear a problem beginning with the following statement, it’s often (through not always) a good candidate for recursion. 
“Design an algorithm to compute the nth…”
“Write code to list the first n”
“Implement a method to compute  all...” 

How to approach: 
Recursive solutions, by definition are built off of solutions to sub-problems. Many times this will mean simply to compute f(n) by adding something, removing something or otherwise changing the solution for f(n-1). In other cases you might solve the problem for the first half of the data set, the the second half and the merge those results

There are many ways you might divide a problem into sub-problems. Three of the most common approaches to develop an algorithm are 
`bottom up`, 
`top down `,
`half half`

## Dynamic Programming & Memoization

Although people make a big deal about how scary dynamic programming problems are, there’s really no need to be afraid of them. In fact once you get the hang of them, these can be very easy problems 

Dynamic programming is mostly just a matter of taking a recursive algorithm and finding the overlapping sub-problems (that is, the repeated calls). You the cache those results for further recursive calls

Alternatively you can study the pattern of the recursive calls and implement something iterative. You still need to “cache” previous work

One of the simplest example of dynamic programming is computing the n'ths Fibonacci number. A good way to approach such a problem is often to implement it as a normal recursive solution and the add the caching part.
