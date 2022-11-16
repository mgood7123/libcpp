# libcpp

# !!! warning !!!

it is `NOT` recommended to use this to pre-process C, C++, or OBJ-C code

such code can depend on internal macro's defined by the compiler

such as `__cplusplus` and `__GNUC__` and others the compiler may pre-define

## compiling

### linux

```sh
make -f makefile.linux clean ; make -f makefile.linux
```

`libcpp.a` is generated in `GCC_OBJECTS_DIRECTORY/libcpp/libcpp.a`

### windows

building is recommended from cygwin


needed packages from cygwin installer: gcc, g++, make, bison, automake


```sh
make -f makefile.windows clean ; make -f makefile.windows
```

`libcpp.a` is generated in `GCC_OBJECTS_DIRECTORY/libcpp/libcpp.a`


consult GCC documentation for the GNU C Preprocessor  https://gcc.gnu.org/onlinedocs/cppinternals/
