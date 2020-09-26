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
