
def gcd(a, b):
    while b != 0:
        t = a
        a = b
        b = t % b
    return a


if __name__ == '__main__':
    a = int(input("Enter a value"))
    b = int(input("Enter b value"))
    print(gcd(a, b))
