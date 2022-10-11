# libcpp

## compiling

```sh
make clean ; make
```

`libcpp.a` is generated in `GCC_OBJECTS_DIRECTORY/libcpp/libcpp.a`


consult GCC documentation for the GNU C Preprocessor  https://gcc.gnu.org/onlinedocs/cppinternals/


## warning

it is `NOT` recommended to use this to pre-process C, C++, or OBJ-C code

such code can depend on internal macro's defined by the compiler

such as `__cplusplus` and `__GNUC__` and others the compiler may pre-define
