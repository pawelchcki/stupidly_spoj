
#read cnt
list=""
#while test $cnt -gt 0:; do 
#  read v
#done

values=( )
helpers=( )

retrv(){
  local no=$1
  local len=${#helpers[*]}
  local i=0
  local elem=xx
  unset rv_no
  unset rv_cnt

  for ((i=0; i<$len; i++)); do
    if [ $no -gt ${helpers[$i]} ]; then
      rv_no=${helpers[$i]}
      rv_cnt=${values[$i]}
    else
      break
    fi
  done
}

reduce(){
  rr_x=$1
  rr_cnt=0
  while [ $(($rr_x % 10)) = 0 ]; do 
    rr_cnt=$(($rr_cnt+1)); rr_x=$(($rr_x / 10));
  done
  rr_x=$(($rr_x % 100))
}

INC=100 #save helper every
count(){
  local target=$(($1 + 1))
  local no=$(($2 + 1))
  local cnt=$3
  if [ xx$cnt = xx ]; then cnt=0; fi

  local memo=1
  while [ $no -lt $target ]; do
    memo=$(($memo * $no))
    reduce $memo
    memo=${rr_x}
    cnt=$(($rr_cnt + $cnt))
    if [ $(($no % $INC)) = 0 ]; then
      len=${#values[*]}
      helpers[$len]=$no
      values[$len]=$cnt
      #echo "dup ${values[@]} ${helpers[@]}"
    fi
    no=$(($no + 1))
  done 
  r_cnt=$cnt
}

iCount(){
  local no=$1
  retrv $no
  count $no $rv_no $rv_cnt
  echo $r_cnt
}


iCount 1024
iCount 1024
iCount 1024
iCount 1024
iCount 3

