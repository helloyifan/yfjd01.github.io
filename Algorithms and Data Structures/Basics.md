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
