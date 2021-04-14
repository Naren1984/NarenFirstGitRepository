def is_leap(year):
    # Write your logic here
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)


"""
def is_leap(year):
    leap = False
    
    # Write your logic here
    if ( year % 4 == 0 and ( year % 100 != 0 or year % 400 == 0 )):
        leap = True
        
    return leap
"""
"""
if __name__ == '__main__':
    n = int(input())
    o=''
    for i in range(n):
        o+=str(i+1)
        
    print(o)
"""

year = int(input())
print(is_leap(year))
