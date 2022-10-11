file="$1"
gcc="$2"
obj_dir="GCC_OBJECTS_DIRECTORY"

if [[ -e "$file" ]]
    then
        rm "$file"
fi

touch "$file"

cat pre >> "$file"

echo "GEN_GCC_FLAGS=--disable-multilib --enable-languages=c" >> "$file"

function gen_internal {
    echo "clean_$2:" >> "$file"
    echo -e "\t rm -rf $1" >> "$file"
    echo "$1: $obj_dir" >> "$file"
    echo -e "\t mkdir -p $1" >> "$file"
    echo "$1/config.status: $1" >> "$file"
    echo -e "\t \$(HOST_EXPORTS)" >> "$file"
	echo -e "\t cd $1 ; \$(HOST_EXPORTS) \$(SHELL) ../../$3/$2/configure --srcdir=../../$3/$2 \$(HOST_CONFIGARGS) --build=\${build_alias} --host=\${host_alias} --target=\${target_alias} --enable-shared" >> "$file"
    #echo -e "\t bash -c \"cd $1; ../../$3/$2/configure \$(GEN_GCC_FLAGS)\"" >> "$file"
    echo "$2: $1 $1/config.status" >> "$file"
    echo -e "\t make -C $1" >> "$file"
}

function gen {
    all+="$1 "
    clean_all+="clean_$1 "
    gen_internal $obj_dir/$1 $1 $gcc
}

echo "$obj_dir:" >> "$file"
echo -e "\t mkdir $obj_dir" >> "$file"

echo "clean_$obj_dir:" >> "$file"
echo -e "\t rm -rf $obj_dir" >> "$file"

gen libcpp

echo "all: $all" >> "$file"
echo "clean: $clean_all clean_$obj_dir" >> "$file"
