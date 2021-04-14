"""
>> ListOfNumbers = [ x for x in range(10) ] # List of integers from 0 to 9
>> ListOfNumbers
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

>>> print([[x, y] for x in [1, 2, 3] for y in [4, 5, 6]])
[[1, 4], [1, 5], [1, 6], [2, 4], [2, 5], [2, 6], [3, 4], [3, 5], [3, 6]]

>> ListOfThreeMultiples = [x for x in range(10) if x % 3 == 0] # Multiples of 3 below 10
>> ListOfThreeMultiples
[0, 3, 6, 9]

"""

if __name__ == '__main__':
    x: int = int(input())
    y = int(input())
    z = int(input())
    n = int(input())

    print([[i, j, k] for i in range(x) for j in range(y) for k in range(z) if i+j+k != n])
