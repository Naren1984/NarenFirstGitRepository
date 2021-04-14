if __name__ == '__main__':
    d = {}
    for i in range(int(input())):
        name = input()
        score = float(input())
        d[name] = score
    second = sorted(list(set(d.values())))[1]
    o = []
    for key, value in d.items():
        if value == second:
            o.append(key)
    f = sorted(o)
    for i in f:
        print(i)
