DEF E=2.718281828459045
DEF PI=3.141592653589793

cdef list a=[1,2,3,4,5]
cdef unsigned int i,n=len(a)-1
for i in range(1,n):
    a[i]=(a[i-1]+a[i]+a[i+1])/3.0
    print(a[i])
