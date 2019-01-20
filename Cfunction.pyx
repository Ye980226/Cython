from libc.stdlib cimport atoi
from cpython.version cimport PY_VERSION_HEX
cdef parse_charptr_to_py_int(char *s):
    assert s is not NULL
    print(PY_VERSION_HEX>=0x030200F0)
    return atoi(s)
