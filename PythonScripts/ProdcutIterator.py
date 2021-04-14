"""
def product(list1, list2):
        l3 =[]
        for i in list1:
            for j in list2:
                l3.append(tuple([i,j]))
        return l3

if __name__ == '__main__':
    l1 = list(map(int, input().split()))
    l2 = list(map(int, input().split()))
    o=product(l1,l2)
    f=''
    for i in o:
        f+=str(i)+' '
    print(f)

"""



from itertools import product

if __name__ == '__main__':
    l1 = list(map(int, input().split()))
    l2 = list(map(int, input().split()))
    print(* product(l1, l2))


"""
About the unpack operator * in *product(a, b)
"""
