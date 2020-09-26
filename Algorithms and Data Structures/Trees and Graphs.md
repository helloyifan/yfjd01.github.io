 Trees and Graphs

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
