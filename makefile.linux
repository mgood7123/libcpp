
release: /usr/bin/gcc-9 /usr/bin/g++-9 /usr/bin/bison /usr/bin/flex /usr/bin/makeinfo build_gcc

GEN_GCC=bash ./gen-make.sh make_gcc cpp
BUILD_GCC=make -f make_gcc libcpp --eval="HOST_SUBDIR=$(pwd)"
CLEAN_GCC=make -f make_gcc clean

build_gcc:
	$(GEN_GCC)
	$(BUILD_GCC)

/usr/bin/makeinfo:
	sudo apt install -y texinfo

/usr/bin/flex:
	sudo apt install -y flex

/usr/bin/bison:
	sudo apt install -y bison

/usr/bin/gcc-9:
	sudo apt install -y gcc-9

/usr/bin/g++-9:
	sudo apt install -y g++-9

clean:
	$(GEN_GCC)
	$(CLEAN_GCC)
