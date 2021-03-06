"""
Task
Given an integer, , perform the following conditional actions:

If  is odd, print Weird
If  is even and in the inclusive range of 2 to 5, print Not Weird
If  is even and in the inclusive range of 6 to 20 , print Weird
If  is even and greater than 20, print Not Weird

"""
# !/bin/python3

import math
import os
import random
import re
import sys

if __name__ == '__main__':
    n = int(input().strip())
    check = {True: "Not Weird", False: "Weird"}
    print(check[n % 2 == 0 and (n in range(2, 6) or n > 20)])

"""
    if n % 2 == 0:
        if 2 <= n <= 5:
            print("Not Weird")
        elif 6 <= n <= 20:
            print("Weird")
        elif n > 20 :
            print("Not Weird")
    else:
        print("Weird")
"""




