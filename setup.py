
from distutils.core import setup
from Cython.Build import cythonize
from distutils.extension import Extension
setup(ext_modules=cythonize("set_test.pyx"))

# ext = Extension(name="Cpointers", sources=["Cpointers.pyx"])
# setup(ext_modules=cythonize(ext))

