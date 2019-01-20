cdef extern from "cfib.h":
    double cfib(int n)
def fib(n):
    """
    Returns the nth Fib
    """
    return cfib(n)