#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
THIS_FILE_NAME=$(basename $0)

source "$THIS_FILE_PATH/index.sh"
#source "$THIS_FILE_PATH/sh-lib-var.sh"
#source "$THIS_FILE_PATH/sh-lib-test.sh"
source "$THIS_FILE_PATH/sh-lib-time-cost.sh"


recordTime "dic.curd.cost"

echo "var is dic"
:<<note
[ $(var_has "a") = "false" ] && dic_ini "a"
#[ $(var_has "a") = "true" ] && dic_add "a"  "name" "hualei"
#[ $(var_has "a") = "true" ] && dic_get "a"  "name"
#[ $(var_has "a") = "true" ] && dic_del "a"  "name"

dic_ini "a"
#test 'dic_ini "a"' ""
test 'var_has "a"' "false"
dic_add "a"  "name" "hualei"
test 'dic_has "a"  "name"' "true"
test 'dic_get "a"  "name"' "hualei"
test 'dic_print "a"' "hualei"
echo ${a[@]}
echo ${!a[@]}

dic_add "a"  "age" "26"
dic_get "a"  "name"
dic_get "a"  "age"

echo ${a[@]}
echo ${!a[@]}
#test 'dic_print "a"' "hualei 26"

note

#:<<note

echo "dic_ini:"
#dic_ini "a"
echo "declare -A a"
#declare -A a #ok
#eval "declare -A a" #ok
#function init_it (){
#  declare -A a
#}
#init_it #no

echo "dic_has:"
dic_has "a"  "name"
dic_add "a"  "name" "hualei"
dic_has "a"  "name"

echo "dic_add:c"
dic_add "a"  "name" "hualei"
dic_has "a"  "name"

echo "dic_add:u"
dic_get "a"  "name"
dic_add "a"  "name" "ymc"
dic_get "a"  "name"

echo "dic_get:r"
dic_get "a"  "name"

#dic_ini "a"

echo "dic_del"
dic_has "a"  "name"
dic_del "a"  "name"
dic_has "a"  "name"

echo "val_by_o:"
echo ${a[@]}
echo "key_by_o:"
echo ${!a[@]}

echo "val_by_p:"
dic_print "a"
echo "key_by_k:"
dic_keys "a"
echo "del_by_c:"

dic_count "a"
dic_clear "a"
dic_count "a"

#note



caculateTime "dic.curd.cost"

## file-usagesss
# ./src/test.sh
