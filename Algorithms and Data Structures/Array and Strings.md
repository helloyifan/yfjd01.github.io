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