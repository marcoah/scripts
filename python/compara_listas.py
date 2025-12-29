import collections

l1 = [1, 2, 3]
l2 = [3, 2, 1]

if collections.Counter(l1) == collections.Counter(l2):
    print("Equal")
else:
    print("Not Equal")