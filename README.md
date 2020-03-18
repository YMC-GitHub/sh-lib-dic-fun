# sh lib dic-fun

## desc

some function for handle dic for ymc shell lib

## deps

- [ ] sh-lib-str
- [ ] sh-lib-arr
- [x] sh-lib-time-cost v1.0.0
- [ ] sh-lib-test

## apis

- [ ] dic_ini
- [x] dic_create
- [x] dic_update
- [x] dic_read
- [x] dic_delete
- [x] dic_remove
- [x] dic_c
- [x] dic_u
- [x] dic_r
- [x] dic_d
- [x] dic_add
- [x] dic_get
- [x] dic_del
- [x] dic_has
- [x] dic_clear
- [x] dic_print
- [x] dic_keys
- [x] dic_count

```sh
cat src/index.sh | grep "function " | sed "s/function */- [x] /g"  | sed "s/() *{//g"
```


## feats

- [x] basic `curd` dic eg.
- [x] with api style `create/update/read/delete`
- [x] with api style `c/u/r/d`
- [x] with api style `create/update/read/remove`
- [x] with style `add/get/del`

## how to use for poduction?

```sh
# get the code

# run the index file
# ./src/index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage
declare -A a #ok
#eval "declare -A a" #ok
dic_c "a"  "name" "hualei"
dic_r "a"  "name"
dic_u "a"  "name" "ymc"
dic_d "a"  "name"
```

## how to use for developer?

```sh
# get the code

# run test
./src/test.sh
#2 get some fail test
#./test.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
