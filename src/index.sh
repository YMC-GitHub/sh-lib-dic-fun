#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
THIS_FILE_NAME=$(basename $0)


###
# 名字: dic_ini
# 参数：名字
# 返回：
# 描述：创建dic
###
function dic_ini (){
  #[ -n "$1" ] && name="$1"
  sh_code=$(cat <<EOF
if [ ! -n "\${$1[*]}" ] ; then
    declare -A $1
    $1=()
    #echo "true"
fi
#declare -A $1
#$1=()
EOF
)
  #echo "$sh_code"
  eval "$sh_code"
}

###
# 名字: dic_add
# 参数：名字，键名
# 返回：
# 描述：设置dic的key对应的取值
###
function dic_add (){
  #[ -n "$1" ] && name="$2"
  #[ -n "$2" ] && key="$2"
  #[ -n "$3" ] && val="$3"
  sh_code=$(cat <<EOF
#if [ -n "\${$1["$2"]}" ] ; then
#    $1+=(["$2"]="$3")
#fi
$1+=(["$2"]="$3")
EOF
)
  #echo "$sh_code"
  eval "$sh_code"
}

###
# 名字: dic_get
# 参数：名字，键名
# 返回：
# 描述：获取dic的key对应的取值
###
function dic_get (){
  #[ -n "$1" ] && name="$2"
  #[ -n "$2" ] && key="$2"
  sh_code=$(cat <<EOF
echo \${$1["$2"]}
EOF
)
  eval "$sh_code"
}


###
# 名字: dic_del
# 参数：名字，键名
# 返回：
# 描述：删除dic的key对应的取值
###
function dic_del (){
  #[ -n "$1" ] && name="$2"
  #[ -n "$2" ] && key="$2"
  sh_code=$(cat <<EOF
$1["$2"]=
EOF
)
  eval "$sh_code"
}


###
# 名字: dic_has
# 参数：名字，键名
# 返回：true/false
# 描述： 检查dic的key对应的取值是否存在
###
function dic_has (){
  #[ -n "$1" ] && name="$2"
  #[ -n "$2" ] && key="$2"
  sh_code=$(cat <<EOF
if [ -n "\${$1["$2"]}" ] ; then
    echo "true"
  else
    echo "false"
fi
EOF
)
  eval "$sh_code"
}

function dic_clear (){
  #[ -n "$1" ] && name="$2"
  sh_code=$(cat <<EOF
for key in \$(echo \${!$1[*]})
do
    $1["\$key"]=
done
EOF
)
  #echo "$sh_code"
  eval "$sh_code"
}

function dic_print (){
  #[ -n "$1" ] && name="$2"
  sh_code=$(cat <<EOF
echo \${$1[*]}
EOF
)
  eval "$sh_code"
}
function dic_keys (){
  #[ -n "$1" ] && name="$2"
  sh_code=$(cat <<EOF
echo \${!$1[*]}
EOF
)
  #echo "$sh_code"
  eval "$sh_code"
}

function dic_count (){
  #[ -n "$1" ] && name="$2"
  sh_code=$(cat <<EOF
local size=
size=0
for key in \$(echo \${!$1[*]})
do
    size=\$[\$size+1]
done
echo "\$size"
EOF
)
  #echo "$sh_code"
  eval "$sh_code"
}

## api style
function dic_find (){
  dic_get "$1" "$2"
}

function dic_create (){
  dic_add "$1" "$2" "$3"
}
function dic_update (){
  dic_add "$1" "$2" "$3"
}
function dic_read (){
  dic_get "$1" "$2"
}
function dic_delete (){
  dic_del "$1" "$2"
}

function dic_c (){
  dic_add "$1" "$2" "$3"
}
function dic_u (){
  dic_add "$1" "$2" "$3"
}
function dic_r (){
  dic_get "$1" "$2"
}
function dic_d (){
  dic_del "$1" "$2"
}

function dic_remove (){
  dic_del "$1" "$2"
}


## file usage
# src/index.sh
