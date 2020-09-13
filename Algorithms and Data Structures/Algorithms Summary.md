***In the spirit of trying…***

# Basic

## Big O
Big O time is the language and metric we use to describe the efficiency of algorithms.

## Time Complexity
This is the concept of asymptotic runtime or big O time, means. We could describe the data transfer algorithm as:

**Electronic Transfer**: O(s) where s is the file size. This means that the time to transfer the file increases linearly with the size of the file. 

Airplane Transfer: O(1) with respect to the size of the file. As the size of the file increases, it won't take any longer to get the file to your friend. The time is constant.

No matter how big the constant is and how slow the linear increase, linear will at some point surpass constant.

## Log N Runtimes:
We commonly see O(log N) in runtimes. Where does this come from?

Let's look at binary search as an example, In binary search we are looking for an example x in an N-element sorted array. We start off with an N-element array to search. Then, after a single step we're down to N/2 element then N/4 we stop when we either find the value or just down to one element.

The total runtime is the a matter of how many steps (dividing N by 2 each time) we can take until N becomes 1. Aka HOw many times can we multiply 1 by 2 until we get N. 

`2^k = N - > log2N = k`

This is a good takeaway for you to have. When you see a problem where the number of elements in the problem in the space gets halved each time, that will likely be O(log N) runtime .

This is the same reason why finding elements in a binary tree takes O(log N). With each comparison, we go either left or right. Half the nodes are on each side, so we cut the problem space in half each time.

## Recursive Runtimes
`O(branches^depth) = O(2^n)ish aka exponential`

When you have a recursive function that makes multiple calls, The runtime will often (but not always) look like O(branches^depth) where branches is the number of times each recursive call branches. In the case with 2 branches it will be O(2^n)

Remember that recursive algorithms take at least O(n) space, where n is the depth of the recursive call.	

# Array and Strings

### Hash Tables
A hash table is a data structure that maps keys to values for highly efficient lookup. There are a number of ways of implementing this. (TODO exercise) 

We use an array of linked lists and a hash code function to insert a key (which might be a string or essentially any other data type).

Implementation of Hash Table: Array of linked lists and a hash-code function that uses array index

First compute the keys in hash code. Note that two different keys could have the same hash code.

Then, map the hash-code to an index in the array. This could be done hash(key)%array_length. Two different hash codes could map to the same index

At this index, there is a linked list of keys and values. Store the key and value in this index. We must use a linked list because of collisions, you could have two different keys

## ArrayList and Resizable Arrays
Also called lists which are automatically resizable. Java arrays are fixed length. The size is defined when you create the array

ArrayList: An array like structure that offers dynamic resizing. It resizes itself as needed while still providing O(1) access


## Amortized insertion runtime O(1): 

Suppose you have an array of size N. We can work backwards to compute how many elements we copied at each capacity increase. Observer that when we increase the array of K elements, the array was previously half the size. Therefore we need to copy K/2 elements to the new array. Thus in order to insert N elements it roughly takes N/2+ N/4 +... 2+ 1 which is a value that's less the N so its not O(N) time its O(1) time

## StringBuilder 

Used for concatenating a list of strings.
We use StringBuilders when concatenation strings because it doesn't require us to copy over the string which is pretty in-efficient over time ie sentence = sentence + w; is creating and copying a new string while sentence.append(S); is more like the resizable array we described earlier

## Linked Lists

* A `linked list` is a data structure that represents a sequence of nodes.
* In a `singly linked list`, each node points to the next node in the linked list. 
* A `doubly linked list` give each node pointers to both the next node and the previous node.
* If you'd like to find the Kth element in the list, you will need to iterate through K elements.

## The "Runner" Technique 
* The "runner" or second pointer technique is used in many linked list problems.
* The runner technique means you iterate through the linked list with two pointers simultaneously, with one ahead of the other

The "fast" node might be ahead by a fixed amount, or it might be hopping multiple nodes for each one node that the "slow node" iterates through.

## Two Pointer in Linked List
Given a linked list, determine if it has a cycle in it. Using the two pointer technique
If there is no cycle, the fast pointer will stop at the end of the linked list
If there is a cycle, the fast pointer will eventually meet with slow pointer

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

# Trees and Graphs

## Type of Trees
A nice way to understand a tree is with a recursive explanation. A tree is a data structure composed of nodes.
Each tree has a root node. 
The root node has zero or more child nodes
Each child node has zero or more child nodes and so on

The tree cannot contain cycles. The nodes may or may not be in a particular order, they could have any data types as values, and they may or may not have links back to their parent nodes, 

## Trees vs Binary Trees
A binary tree is a tree in which each node has up to two children. A node is called a "leaf" node if it has no children

## Binary Trees vs Binary Search Trees
A binary search tree is a binary tree in which every node fits a specific ordering property: 

`all left descendents <= n < all right descendents`.


Note that this inequality must be true for all node's descendents, not just its immediate children. 

## Balanced vs Unbalanced
Note that balancing a tree  does not mean the left and right subtrees are exactly the same size 

It is balanced enough to ensure `O(log n)` times for insert and find.

## Complete Binary Tree:
A binary tree in which every level of the tree is fully filled with the exception for the last level which is still filled from left to right

## Full Binary Tree:
Every node has either two or zero children

## Perfect Binary Tree:
Both full and complete, maximum number of nodes for given level

## Binary Tree Traversal

### In-Order Traversal
In-order traversal means to "visit" (often, print) the left branch, the the current node, and finally the right branch. When performed on a binary search tree, it visits the nodes in ascending order 

`travel(node.left);`
`visit(node);`
`travel(node.right);`


### Pre-Order Traversal
Pre order traversal visits the current node before its child nodes. The root is always the first node to visit

`visit(node);`
`travel(node.left);`
`travel(node.right);`


### Post-Order Traversal
Post-order traversal visits the current node after its child nodes. The root is always the last node to visit 

`travel(node.left);`
`travel(node.right);`
`visit(node);`

## Binary Heaps (Min-Heaps and Max-Heaps)
A min heap is a complete binary tree (totally filled every level except for last level which is filled from left to right). Where each node is smaller than its children. The root is the minimum element of the tree

`insert():`
When we insert into a min-heap we always start by inserting the element at the bottom, we insert at the rightmost sport  as to maintain the complete tree property
The we fix the tree by swapping, the new element with its parent, until we find an appropriate spot, essentially bubble up the minimum element
Takes O(logn) time where n is the number of nodes in the heap

`extract_min():`
Extracting minimum element
Always at the top, trickier part is how to remove 
First we remove the element and swap it with the last element in the heap (bottom right most) The we bubble down this element, swapping it with its smallest children until the min heap property is restored.

Swapping with smallest children guarantees that root is still smallest, since we know that none of grandchildren can be smaller the child, no can any of the other node's children can be smaller (since it was a valid min heap before).
This algorithm takes O(logn) time

## Tries (Prefix Trees)
A trie (prefix) is a variant of an n-ary tree in which characters are stored at each node, Each path down the tree may represent a word
The `*` Node (sometimes called  "null node") are often used to indicate complete words. The actual implementation of these * nodes might be a special type of child or a boolean flag that terminates
A node in a trie could have anywhere from 1 through ALPHABET_SIZE + 1 children

Very commonly, a true is used to sore the entire (English) language for quick prefix lookup. Which a hash table can quickly look up whether a string is a valid word, it cannot tell us if a string is a prefix of any valid words. A trie can do this very quickly

Many problems involving lists of valid words leverage a tries as an optimization. In situations when we search through a tree on related prefixes repeatedly (e.g lookup M then MA then MAN then MANY) we might pass around a reference to the current node in the tree. This will allow us to just check if Y is a child of MAN rather than starting from the root each time

### Tries with Array:
use an array to store children nodes
For instance, if store strings which only contains letter a to z we can declare an array whose size is 26 in each node to store its children nodes, And for a specific character c, we can use c to store 'a' as the index to find the corresponding child node in the array
It is really fast to visit a child node. It is comparatively easy to visit a specific child since we can easily transfer a character to an index in most cases. But not all children nodes are needed. So there might be some waste of space

```
class TrieNode {
    // change this value to adapt to different cases
    public static final N = 26;
    public TrieNode[] children = new TrieNode[N];
    
    // you might need some extra values according to different cases
};
```
```
/** Usage:
 *  Initialization: TrieNode root = new TrieNode();
 *  Return a specific child node with char c: root.children[c - 'a']
 */
```


### Tries with Map
Use a hashmap to store children nodes
We can declare a hashmap in each node. The key of the hashmap are characters and they value is the corresponding child node


Graphs:
A tree is actually a type of graph, but not all graphs are trees. Simply put, a tree is a connected graph without cycles

A graph is simply a collection of nodes with edges between some of them
Graphs can either be directed or undirected
Directed Edges are like one way streets
Undirected Edges are like a two way street
The graph might consists of multiple isolated subgraphs. If there is a path between every pair of vertices (nodes) it is called a connected graph 
Graphs can contain cycles, graph without cycles is called Acyclic graph

Adjacency List:
This is the most common way to represent a graph, Every vertex (or node) stores a list of adjacent vertices. In an undirected graph, an edge like (a,b) would be stored twice: once in a adjacent vertices and once in b's adjacent vertices 

We also need to use a graph class because unlike trees, you can't necessarily reach all the nodes from a single node.

We don't need any additional classes to represent a graph. An array (or a hashtable) of lists (arrays, arraylist,linkedlist etc) can store the adjacency list.

Adjacency Matrix
An adjacency matrix is a nxn boolean matrix where n is the number of nodes and where true value at matrix[i][j] indicates an edge from i to j.

In an undirected graph, an adjacency matrix will be symmetrics. In a directed graph, it will not (necessarily) be.

The same graph algorithms that are used on adjacency list (bfs, etc) can be performed on adjacency matrix. but they are less efficient. 
In the adjacency list representation you can easily iterate through the neighbours of a node
In the adjacency matrix representation you will need to iterate through all the nodes to identify a node's neighbours.
 
Graph Search

Depth First Search:
We start at the root (or another arbitrarily selected node) and explore each branch completely before moving to the next branch that is we go deep first before we go wide

Breadth First Search:
We start at the root (or another arbitrarily selected node) and explore each neighbour before going to any of its children. That is go wide before we go deep.

TODO the cute graph

Scenarios:
DFS is prefered if we want to visit every node in the graph. (both work)
BFS is prefered (better) for shortest path (or any path) between two nodes (path of friendship)

Depth First Search:
In DFS, we visit a node a and the iterate through each of a's neighbors, 
When visiting a node b that neighbor of a, 
we visit all of b's neighbours 
before going on to a's other neighbors
We exhaustively search b's branch before any of its others neighbours

Note: that pre-order and other forms forms of tree traversal are a form of DFS 

The key difference is that when implementing this algorithm for a graph, we must check if the node has been visited. If we don't, we risk getting caught in an infinite loop . (if n.visited == false)

Breadth First Search
Protip: use a queue

BFS is a bit less intuitive. The main tripping point is the that BFS is NOT RECURSIVE, it must use a queue.

In BFS node a visits each of a's neighbors before visiting any of their neighbors. You can think of this as searching level by level out from a.  an Iterative solution works best

If you are asked to implement BFS, the key thing to remember is to use the queue. The rest of the algo flows from this fact.

  
# Bit Manipulation

## Recall: Bitwise:

* `<<`: 	Left shift operator (Multiply by 2^n)
* `>>`:	Right shift operator (arithmetic shift right) (Divide by 2^n)
* `>>>`:	Bitwise zero fill right-shift operation (logical shift right) Logical right shift, however, does not care that the value could possibly represent a signed number; 
* &: 	bitwise AND
* |: 	wise OR
* ^:	 bitwise XOR
* ~: 	bitwise Not

Usage:             
`n = n >>> 1;`
Right shift zero filled 

`c = c + ( n & 1);`
Whatever number n is and binary 1. 
Only comparing first bit

`a=2; a= a<<4:`
Shift right 4 times so its 32


 
## Bit Facts and Tricks

The following expressions are useful in bit manipulation.

x ^ 0s = x
for ^  each bit is true when one bit is true, thus the result will be the same 
x ^ 1s = ~x
since all of 1's bits are going to flip x's bits, 1^0 = 1 and 1^1 = 0
x ^ x = 0
since 1^1 = 0 and 0^0 = 0
x & 0s = 0 
All zero Since  1 & 0 = 0 and 0&0 =0 
x & 1s = x
Nothing happens since if 1^1=  1 and 0^1 = 1
x & x = x
Nothing happens since 1 & 1 = 1 and 0&0 = 0
x | 0s = x
Since when x == 1, it'll remain 1, nothing happens
x | 1s = 1s
Since 1s are always true results is 1s
x | x = x
Nothing happens 1|1 = 1 and 0|0

Two's Complement and Negative numbers

A positive number is represented as itself while a negative number is represented as the two's complement of its absolute value(with a 1 in its sign bit to indicate that a negative value
The two's complement of an N-bit number (where N is the number of bits used for the number , excluding the sign bit) is the complement of the number with respect to 2^N

For example consider the 4 bit integer -3
Since its 4 bits we have one bit for the sign and three bits for the value
We want the complement with respect to 2^3 which is 9.
The complement of 3 (the absolute value of -3) which respect to 8, is  5.
5 is binary for 101. Therefore -3 is binary as  a  4 bit digit number is 5
Therefore -3 in binary as a 4 bit number is 1101 with the first bit being the sign bit
concat(1, 2^(n-1) - k)

Another way to look at this is that we invert the bits in the positive representation and the add 1.
3 is 011, Flip the sign bit (100) add 1 (101), the prepend the sign bit(1) to get 1101


Arithmetic vs Logical Right Shift
There are two right shift operators.The arithmetic right shift essentially divided by two. 
The logical right does what we would visually see as shifting the bits. This is best seen on a negative number (shift the negative sign once too)

int repeatedArithmeticShift(int x, int count){
	for(int i = 0; i < count; i++){
	x >> =1; //Arithmetic shift by 1
}
return x;
}

This will return -1 (111111111111111111)
We shift all the bits (including sign bit to the right by one. but the sign bit replaces itself it it was 1)

int repeatedLogicalShift(int x, int count){
	for(int i =0; i < count; i++){
	x >>>= 1; //Logical shift by 1
}
return x;
}
This will return 0 (00000000000000000)
Disregard the sign bit, shift it and turn it to 0 if it was 1

Common Bit Tasks: Getting and Setting

The following operations are very important to know, but do not simply memoize them.Understand how to implement therese methods.

Get Bit
This method shifts 1 over by 1 bits, creating a value that looks like 00010000. 
By performing an AND with num, we clear all bits other than the bit at bit i. 
Finally we compare that to 0. the bit i must have a 1, otherwise bit I is a 0

boolean getBit(int num, int i){
	return ((num & (1 <<i)) != 0);
}

Set Bit
SetBit shifts 1 over by i bits, creating a value like 00010000
By performing an OR with num
only the value at bit i, will change
All other bits of the mark are zero and will not affect num

boolean setBit(int num, int i){
	return( num | (1<<i);
}

Clear Bit
This method operates in almost the reverse way of set bit
We first create a number like 11101111 by creating the reverse of it (00010000) and negating it. (create a mask with the hole at the big we wanna negate, flip it)
Then we perform an AND with num. This will clear the ith bit and leave the remainder unchanged

int clearBit(int num, int i){
	int mask = ~(1<<i); // 11101111
	return n & mask;
}

To clear all the bits from i to 0 (inclusive)
we take a sequence of all 1s (-1) and left shit it by i + 1 bits
This gives us a sequence of 1s (in the most significant bits) followed by i 0 bits
int clearBit(int num, int i){
	int mask = (-1 << (i+1); // 11110000
	return n & mask;

Update Bit
To set the its bit to a value v, we first clear the bit at position i
We clear it using a mask (then negating and AND in the mask)
This will create a number with bit i equal to v and all other bits equal to 0
int updateBit(int num, int i, boolean isOne){
	int value = (isOne)?1 : 0;
	int mask = ~(1 << i)
	return (num & mask)  | (value << i);
} 
Recursion and Dynamic Programming

While there are a large number of recursive problems, many follow similar patterns. A good hint is that a problem is recursive is that it can be built off of subproblems. 

When you hear a problem beginning with the following statements, it's often (though not always) a good candidate for recursion.
Design an algorithm to compute the nth...
Write code to list the first n ...
Implement a method to compute all..

How to Approach
Recursive solutions, by definitions are built off of solutions to subproblems. Many times, this will mean simply to compute f(n) by adding something, removing something, or otherwise changing the solution for f(n-1). 
In other cases you might solve the problem for the first half of the data set, the the second halfm and the merge those results

There are many ways you might divide a problem into subproblems. Three of the most common approaches to develop an algorithm are bottom-up, top-down, and half and half

Bottom-Up
Top-Down
Half and Half

Your DP Glossary

Memoization:
Most important term, often conflated with dynamic programming
Technique for storing computed value
Use this to store the results of repeated computations
sounds like "memorization"

Two characteristics of DP problems (formal definition)
To be effectively optimized using DP a problem must have
Optimal Substructure
Overlapping Subproblems

Optimal Substructure
We can find the optimal solution to the problem by knowing the optimal solution to the subproblems
Basically recursion

Overlapping Subproblems
Recursive functions break problems into subproblems
We sometimes compute the same subproblem more than once
This is unnecessary work that can be optimized

Two types of DP solutions
We can use dynamic programming in 2 different ways 
Top-down
Bottom-up

Top-down
A recursive solution
Start at the "top" and break down the problem into subproblems
Often easier to understand the logic of the problem

Bottom UP
Opposite of top down
Build up solutions iteratively
Start with the base case and progressively solve large subproblems
Often faster due to the slowness of recursion call

Top-down versus bottom-up
Both are equally valid

Can I solve this problem using DP
Check if the problem can be solved with optimal substructure and it has overlapping subproblems
Thus find a brute force solution first
Draw a diagram of the solution

Quick Problem Identification
Common patterns so you can quickly identify potential DP problems
Maximization
Minimization
Optimization
Counting 
Ask yourself if you can solve this problem by enumerating all the possibility.

DP versus Greedy Algorithm
Greedy algorithms consider only local optimization
Dynamic programming problem consider every option (look at every path and see what is the shortest)
Can we make 100% accurate decisions using only historical data? 
(the we can use greedly, otherwise we have to use DP)
Try to identify counterexample to disprove you can use a greedy algorithm 

The FAST method
A generalized approach to solving any dynamic programming problem
Takes the brute force solution and optimizes it
Walks through both top down and bottom up solutions
Uses top down to find bottom up

FAST
Finding the First solution
Analyze the first solution
Identify the Subproblems
Turn around the solution

Framework for solving dynamic programming problems  (like a recipe) 
As you get more comfortable, you can deviate as necessary
Framework centers you when you get stuck

Demo Problems
Fibonacci numbers
Given an integer n, write a function to return the nth fibonacci number
Number of Combinations
Given an array of integers write a function to compute the total number of combinations of integers

1. Find the first solution
Let's find a recursive brute force solution

Notes on recursion
We need to compute each subproblem separately and combine them
Without input from outside (for example global variables)
No passing through a result array
Cant pass by reference
Avoid global variables and all unnecessary variables

2. Analyze the brute force solution
Figure out can we use Dynamic programming?
Our two criteria
So does it have optimal substructure
does it have overlapping subproblems?
Is our current solution inefficient

Fibonacci Numbers Brute force Analysis
Has optimize substructures
Yes it does, because we are solving it recursively with discrete subproblems
Do we have overlapping subproblems?
Draw a diagram (execution tree) to see if there are overlapping subproblems
Tip: ignore base cases
Yes it does, we can reuse the solutions we computed

Time complexity for recursive function
Generally can be computed from branching factor and maximum tree height
At each level of the tree we increase the number of subproblems by a branching factor. Therefore we get BF * BF * BF * … or branching factor ^maximum height
O(branching factor^maximum height)

Array Combinations Brute force Analysis
Has optimal substructure
Yes it does, because recursion
Do we have overlapping subproblems?
Draw a diagram
Yes each "level" is the same subproblem
Branching factor is 2 and height of tree is arr.length (call that n)
Time complexity is O(2^n)
Same complexity is O(n) (we are at going N deep)

Key Takeaways of 2.
Drawing a diagram is the best way to understand recursive functions
Diagrams help us see the subproblems and verify that we do have optimal substructures
O(branching factors ^maximum height)
Both of our problems can be optimized using DP, so we can move on to the next step.


3. Identifying the Subproblems
We will be memoizing subproblems results to avoid recomputing
Need to know exactly what the subproblems are
We can approximately identify the subproblems by finding the recursive calls in our code
However, the key is to define them in plain English

Fibonacci Numbers
Add to dp array whenever we compute anything
Do look up first only compute if we don't have it in do
No need to put base case in dp array
Much more efficient code
Only compute each subproblem once
Time complexity of O(n)
Space Complexity of O(n): depth of recursion O(n) + space used by array O(n)

Array combinations
More difficult to nail down the subproblems
Subproblems we call are combinations(arr,i+1)
In plain English, combination (arr, i ) is the number of combinations of elements i through n
Pay attention to which variables change from call  to call, those variables will be a candidate for i in dp[i] or which variables does the result of the variables depend on 

We are only computing each subproblem once, thus the runtime is the number of subproblems we have ie the number of keys we have in our dp which is often O(n).

Key Takeaways
We can identify subproblems by looking at recursive calls
key key, Describe the subproblems in plain english
It is easy to add a cache and get a dynamic solution.

4. Turn Around the solution

Why bother?
Recursive solutions are often slower
Shorter, more straightforward code
Easier to reason about complexity of iterative code

Turn around the solution
use the subproblems we identified easier
Start with the bases cases (s) and iteratively solve larger subproblems

Fibonacci Number Example
Start with the base cases (fib(0) and fib(1))
Iteratively fill in the remainder of the cache
Return dp[n]
Code is much more straightforward
Was to see O(n) time complexity and space because of for loop

Key Takeaways
Focus on the subproblems that we previously identified
If you're iterating over an array, it is helpful to flip the subproblem definition, so that we can build up from 0 to n instead of n to 0
This is simple at a high level but can quickly gain complexity

Sorting and Searching 
Understanding the common sorting and searching algorithms is incredibly valuable, as many sory and searching problems are tweaks of well known approach.

Learning the common sorting algorithms is a great way to boost your performance. Of the five algorithms explained below, Merge sort, Quick Sort and Bucket sort are the most commonly used in interviews.

Bubble Sort: O(n^2) average and worst case. Memory O(1)

In bubble sort, we start at the beginning of the array and swap the first two elements, if the first is greater than the second.
The we go to the next pair and so on, continuously making sweeps of the array until it is sorted.
In doing so, the smaller item slowly "bubbles" up to the beginning of the list

Merge Sort O(nlogn) average and worst case 

Merge sort divides the array in half, sorts each of those halves and the merges them back together.
Each of those halves has the same sorting algorithm applied to it
Eventually you are merging just two single element arrays .

The merge method operates by copying all the elements from the target array segment into a helper array,
Keeping track of where the start of the left and right halves should be.
We the iterate through helper, copying the smaller element from each half into the array. At the end we copy any remaining elements into the target array


10 Ways to get unstuck

Find a brute force solution
Fully Understand the problem
Work Through the problem by hand
Brainstorm different data structures and algorithms
Consider all the information you're given
Simplify the problem
Break down the problem into subproblems
Take a step back
Collaborate with you interviewer
Ask for help
