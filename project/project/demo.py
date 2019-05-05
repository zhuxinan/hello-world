
# a = 1
# b = 1
# for i in range(1,22):
#     print(a,b)
#     if (i%3) == 0:
#         print(i)
#     a=a+b
#     b=a+b

h=0
leap=1
from math import sqrt
from sys import stdout
for m in range(101,201):
    k = int(sqrt(m+1))
    for i in range(2,k+1):
        if m % i == 0 :
            leap = 0
            break
    if leap == 1:
        print(m)
        h += 1
        if h % 10 == 0 :
            print()
    leap = 1
print(h)