"""
A dictionary is a data type which stores values in pairs.
For each element in the dictionary, there is a unique key that points to a value. A dictionary is mutable. It can be changed.

a_dict['two'] = 2 # Adds key 'two' which points to 2
print a_dict['one']
# prints 1
if 'three' in a_dict:
    # To check whether a certain string exist as a key in the dictionary
    print a_dict['three']
else:
    print "Three not there"
# prints Three not there
del a_dict['one']
# Deletes index 'one' and the value associated with it
print a_dict
# prints {'two': 2}
"""
"""
Problem 1 : 
i/p :
3
Krishna 67 68 69
Arjun 70 98 63
Malika 52 56 60
Malika

o/p :
56.00
"""

if __name__ == '__main__':
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()
    l = student_marks[query_name]
    total = 0
    for i in l:
        total += i
    l_avg = float(total/len(l))
    print("{:.2f}".format(l_avg))