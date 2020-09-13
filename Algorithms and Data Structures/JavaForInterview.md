# Java Syntax to refer back to

## Lists
Create a list with Arraylist
```
// Creating object of ArrayList<Integer> 
List<Integer> list = new ArrayList<Integer>(); 
```

Add is just add: 
```
// Populating List 
list.add(1); 
list.add(2); 
list.add(3); 
```

Get: 
```
list.get(0);
```

Length
```
list.size(); 
```

iterate through a list
```
for (int i = 0; i < list.size(); i++) {
    System.out.println(list.get(i));
}
```

ArrayList provides two overloaded remove() method.
a. remove(int index) : Accept index of object to be removed.
b. remove(Object obj) : Accept object to be removed

```
List<Integer> al = new ArrayList<>(); 
al.add(10); 
al.add(20); 
al.add(30); 
al.add(1); 
al.add(2); 

// This makes a call to remove(int) and  
// removes element 20. 
al.remove(1); 
    
// Now element 30 is moved one position back 
// So element 30 is removed this time 
al.remove(1);
```

Clone a list
```
List<Integer> copyOfremaining = new ArrayList<Integer>(remaining);
```


## Strings

String length
```
int length = str.length()'
```

String get index of
```
char charAtZero = text.charAt(0);
```


## Queues
```
        Queue<Integer> q  = new LinkedList<>(); 
```

```
// Adds elements {0, 1, 2, 3, 4} to 
// the queue 
for (int i = 0; i < 5; i++) 
    q.add(i); 
```


```
// Display contents of the queue. 
System.out.println("Elements of queue " 
                    + q); 
```


POP
```
// To remove the head of queue. 
int removedele = q.remove(); 
System.out.println("removed element-" 
                    + removedele); 
```

Peek
```
// To view the head of queue 
int head = q.peek(); 
System.out.println("head of queue-"
                    + head); 
```

```
// Rest all methods of collection 
// interface like size and contains 
// can be used with this 
// implementation. 
int size = q.size(); 
System.out.println("Size of queue-"
                    + size); 