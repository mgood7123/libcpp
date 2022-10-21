mapfile -d '' files < <(find ! '(' -name .git -prune ')' -type f -print0)

lines=${#files[@]}

for idx in "${!files[@]}"; do
    printf "(%${#lines}d/%d) - transforming %s\n" "$(($idx + 1))" "$lines" "${files[idx]}"
    perl -pi -e 's/\r\n/\n/' "${files[idx]}"
done