"""
Tuples are data structures that look a lot like lists. Unlike lists, tuples are immutable (meaning that they cannot be modified once created). This restricts their use because we cannot add, remove, or assign values; however, it gives us an advantage in space and time complexities.

A common tuple use is the swapping of 2 numbers:

a, b = b, a

Here a,b is a tuple, and it assigns itself the values of b,a.

Another awesome use of tuples is as keys in a dictionary. In other words, tuples are hashable.

"""
# converting input 1,2 to tuple and finding hash value

"""
ip:
2
1 2

op : hash value
hash(tuple)
"""

if __name__ == '__main__':
    n = int(input())
    integer_list = map(int, input().split())
    print(hash(tuple(integer_list)))