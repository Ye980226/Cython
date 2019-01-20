cdef double golden_ratio=1.0
cdef double *p_double=&golden_ratio
print(p_double[0])
cdef list l1
cdef str s1
cdef dict d1
cdef set s2
cimport cython 
@cython.cdivision(True)
def divides(int a,int b):
    return a/b
def remainer(int a,int b):
    with cython.cdivision(True):
        return a%b
