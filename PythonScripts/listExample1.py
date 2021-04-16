"""
    N = int(input())
    l = []
    for i in range(N):
        gl = input().split()
        len1 = len(gl)
        if len1 == 3:
            x, y, z = gl
        elif len1 == 2:
            x, y = gl
        elif len1 == 1:
            x = gl[0]
        else:
            break
        if x == 'insert':
            l.insert(int(y), int(z))
        elif x == 'remove':
            l.remove(int(y))
        elif x == 'append':
            l.append(int(y))
        elif x == 'sort':
            l.sort()
        elif x == 'print':
            print(l)
        elif x == 'pop':
            l.pop()
        elif x == 'reverse':
            l.reverse()
        else:
            print("Provide either of commands (insert, append, remove, print , reverse, sort)")
"""
if __name__ == '__main__':
    n = int(input())
    l = []
    for _ in range(n):
        s = input().split()
        cmd = s[0]
        args = s[1:]
        if cmd !="print":
            cmd += "("+ ",".join(args) +")"
            eval("l."+cmd)
        else:
            print(l)
