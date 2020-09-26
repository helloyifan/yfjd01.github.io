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