
#read cnt
list=""
#while test $cnt -gt 0:; do 
#  read v
#done

values=()

retr(){
  local no=$1
  local cnt=0
  local r=xx
  for elem in $list; do
    if [ $no -gt $elem ]; then
      r="$elem ${values[$cnt]}"
      cnt=$(($cnt+1))
    else
      break
    fi
  done
  echo $r
}

#retr 59
#retr 61
#retr 101

#retr 1025

reduce(){
  local x=$1
  local cnt=0
  while [ $(($x % 10)) = 0 ]; do cnt=$(($cnt+1)); x=$(($x / 10)); done
  x=$(($x % 100))
  echo $cnt $x
}


INC=10
cunt(){
  local target=$(($1 + 1))
  local no=$(($2 + 1))
  local cnt=$3
  if [ xx$cnt = xx ]; then cnt=0; fi
  #if [ xx$no = xx ]; then no=1; fi

  local memo=1
  while [ $no -lt $target ]; do
    memo=$(($memo * $no))
    r=( $(reduce $memo) )
    memo=${r[1]}
    cnt=$((${r[0]} + $cnt))
    if [ $(($no % $INC)) = 0 ]; then 
      list="$list $no"
      len=${#values[*]}
      values[$len]=$cnt
      echo dup ${values[@]} $list
    fi
    no=$(($no + 1))
  done 
  echo $cnt
}

cunt 100 #90 21 
