if __name__ == '__main__':
    """
        2nd approach 
        n = int(input())
        nums = map(int, input().split())
        print(sorted(list(set(nums)))[-2])
    """
    n = int(input())
    arr = map(int, input().split())
    w = None
    r = None
    for i in arr:
        if w is None:
            w = i
        elif w < i:
            r = w
            w = i
        elif w == i:
            continue
        elif r is None:
            r = i
        elif r < i:
            r = i
        elif r == i:
            continue
    print(r)

