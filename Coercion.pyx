ctypedef struct mycpx:
    float read
    float imag
ctypedef union uu:
    int a
    short b,c
cdef mycpx zz
zz.real=3.1415
zz.imag=-1.0
cdef mycpx a=mycpx(3.1415,-1.0)
cdef mycpx b=mycpx(real=2.718,imag=1.618034)
# cdef mycpx z={'real':3.1415,'imag':-1.0} more overhead
cdef struct _inner:
    int inner_a
cdef struct nested:
    int outer_a
    _inner inner
cdef nested n={'outer_a':1,'inner':{'inner_a':2}}
cdef enum PRIMARIES:
    RED=1
    YELLOW=3
    BLUE=5
cdef enum SECONDARIES:
    ORANGE,GREEN,PURPLE
cdef enum:
    GLOBAL_SEED=37

ctypedef double real
ctypedef long integral
cpdef displacement(real d0,real v0,real a,real t):
    """Calculates displacement under constant acceleration."""
    cdef real d=d0+(v0*t)+(0.5*a*t**2)
    return d

def print_address(a):
    cdef void *v=<void*>a
    cdef long addr=<long>v
    print("Cython address:",addr)
    print("Python id     :",id(a))
def cast_to_list(a):
    cdef list cast_list=<list?>a#不确定的时候可以在list后面加个问号判断是否可以强制转换
    print(type(a))
    print(type(cast_list))
    cast_list.append(1)

from cython cimport integral
cpdef integral integral_max(integral a,integral b):
    return a if a>=b else b
cdef allowed():
    print integral_max(<short>1, <short>2)
    print integral_max(<int>1, <int>2)
    print integral_max(<long>5, <long>10)
# 不可以混合使用
cdef not_allowed():
    print integral_max(<short>1, <int>2)
    print integral_max(<int>1, <long>2)
cimport cython
ctypedef fused integral_or_floating:
    cython.short
    cython.int
    cython.long
    cython.float
    cython.double
cpdef integral_or_floating generic_max(integral_or_floating a,integral_or_floating b):
    return a if a>=b else b
#When looping over a range call , we should type the range argument as a C integer:
cdef int N=10
for i in range(N):
    print("I am handsome")
    #如果我们要用i作为下标，就需要define i 为C的类型
cdef int i,N=5
cdef list a=[1,2,3,4,5]
for i in range(N):
    a[i]=i+1
