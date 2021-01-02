## Java Syntax

***Why bother remembering***

### Array Declaration
```
int[] intArray = new int[20];
```


## Length of array 
```
int len = intArray.length;
```

## Ternary operator

```
result = condition ? trueCase : elseCase;
```

### Good resource for Java8 advanced 
https://mkyong.com/tutorials/java-8-tutorials/

### forEach

```
Map<String, Integer> map = new HashMap<>();
map.put("A", 10);
map.put("B", 20);

// lambda
map.forEach((k, v) -> System.out.println("Key : " + k + ", Value : " + v));
```

more fun lambda

```
map.forEach(
    (k, v) -> {
        // yes, we can put logic here
        if (k != null){
            System.out.println("Key : " + k + ", Value : " + v);
        }
    }
);
```

### Method references, double colon (::) operator

recall Anonymous class

```
List<String> list = Arrays.asList("node", "java", "python", "ruby");
list.forEach(new Consumer<String>() {       // anonymous class
    @Override
    public void accept(String str) {
        System.out.println(str);
    }
});
```

recall Lambda expressions.
```
List<String> list = Arrays.asList("node", "java", "python", "ruby");
list.forEach(str -> System.out.println(str)); // lambda
```

new cool way,  Method references.
```
List<String> list = Arrays.asList("node", "java", "python", "ruby");
list.forEach(System.out::println);          // method references
```

**Hierarchy: Anonymous Class -> Lambda expression -> Method Reference**

Note
Both lambda expression or method reference does nothing but just another way call to an existing method. With method reference, it gains better readability.


For more examples: https://mkyong.com/java8/java-8-method-references-double-colon-operator/